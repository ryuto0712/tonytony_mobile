import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tonytony_mobile/data/models/user/user.dart';

final profileModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => ProfileModel());

class ProfileModel extends ChangeNotifier {
  TextEditingController _userNameController = TextEditingController();
  get userNameController => _userNameController;

  TextEditingController _profileController = TextEditingController();
  get profileController => _profileController;

  //コンストラクタとは、インスタンス生成時に作られるメソッドである。
  ProfileModel() {
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
          userIcon: data["iconUrl"],
        );
      }
      return User(userName: 'hahaha', userIcon: "hello");
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

  Future<void> init() async {
    await fetchPostList();
    _userNameController.addListener(notifyListeners);
    _profileController.addListener(notifyListeners);
  }
}
