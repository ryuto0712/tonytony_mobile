import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tonytony_mobile/data/models/post/post.dart';
import 'package:tonytony_mobile/data/models/user/user.dart';

final postModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => PostModel());

class PostModel extends ChangeNotifier {
  //コンストラクタとは、インスタンス生成時に作られるメソッドである。
  PostModel() {
    init();
  }
  List<Post> postList = [];
  User? user;

  //todo ？
  final Stream<QuerySnapshot<Map<String, dynamic>>> _usersStream =
      FirebaseFirestore.instance.collection('postItem').snapshots();
//以下はユーザー情報をデータベースから取ってくる処理
// それぞれの投稿に紐づくユーザー情報を得るためにそれぞれの投稿のユーザーIDが必要になる
  Future<User> fetchUser(String id) async {
    //todo ？
    User toPost(DocumentSnapshot e) {
      final data = Map.from(e.data() as Map<String, dynamic>);
      if (data != null) {
        return User(
          userName: data["userName"],
          iconUrl: data["iconUrl"],
        );
      }
      return User(userName: 'hahaha', iconUrl: "hello");
    }

    final snapShot =
        //データベースのコレクションを全てとってくる（返り値の型がFutureなのがget,streamなのがsnapshot）
        await FirebaseFirestore.instance.collection('user').doc(id).get();
    return toPost(snapShot);

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

  Future<void> fetchPostList() async {
    //todo ？
    Post toPost(DocumentSnapshot e) {
      final data = Map.from(e.data() as Map<String, dynamic>);
      if (data != null) {
        return Post(
          message: data[PostField.message],
          userId: data["userId"],
        );
      }
      return Post(userId: 'hahaha', message: "hello");
    }

    final snapShot =
        //データベースのコレクションを全てとってくる（返り値の型がFutureなのがget,streamなのがsnapshot）
        await FirebaseFirestore.instance.collection('postItem').get();
    //docs = Documents（firebaseはdocumentでできている）
    postList = snapShot.docs.map((e) => toPost(e)).toList();
    for (final posttee in postList) {
      posttee.user = await fetchUser(posttee.userId);
      // print(posttee.user!.userName);
    }
    // print(postList);
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

  //以下の処理で、firebaseに保存
  Future<void> post() async {
    await FirebaseFirestore.instance.collection('postItem').add({
      //instanceにはfirebaseの色んな機能をまとめたinstanceでそのinstanceのUserを呼び出している
      'userId': auth.FirebaseAuth.instance.currentUser?.uid,
      'message': _textEditingController.text,
    });
  }
}
