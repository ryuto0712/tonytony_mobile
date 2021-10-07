import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tonytony_mobile/data/models/user/user.dart';

final userModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => UserModel());

class UserModel extends ChangeNotifier {
  //コンストラクタとは、インスタンス生成時に作られるメソッドである。
  UserModel() {
    init();
  }
  User? user;

  Future<void> fetchPostList() async {
    //todo ？
    User toPost(DocumentSnapshot e) {
      final data = Map.from(e.data() as Map<String, dynamic>);
      if (data != null) {
        return User(
          userName: data["username"],
          iconUrl: data["iconUrl"],
        );
      }
      return User(userName: 'hahaha', iconUrl: "hello");
    }

    final snapShot =
        //データベースのコレクションを全てとってくる（返り値の型がFutureなのがget,streamなのがsnapshot）
        await FirebaseFirestore.instance
            .collection('user')
            .doc(auth.FirebaseAuth.instance.currentUser?.uid)
            .get();
    user = toPost(snapShot);

    print(user);
    // _usersStream.listen((QuerySnapshot snapshot) {
    //   final List<Post> posts = snapshot.docs.map((DocumentSnapshot document) {
    //     Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    //     final String message = data["message"];
    //     // return Post(message);
    //   }).toList();
    //todo ?
    // this.posts = posts;
    notifyListeners();
    // });
  }

  TextEditingController _textEditingController = TextEditingController();
  get textEditingController => _textEditingController;

  Future<void> init() async {
    await fetchPostList();
    _textEditingController.addListener(notifyListeners);
  }

  Future<void> post() async {
    await FirebaseFirestore.instance.collection('postItem').add({
      //instanceにはfirebaseの色んな機能をまとめたinstanceでそのinstanceのUserを呼び出している
      'userId': auth.FirebaseAuth.instance.currentUser?.uid,
      'message': _textEditingController.text,
    });
  }
}
