import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tonytony_mobile/data/models/post/post.dart';

final postModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => PostModel());

class PostModel extends ChangeNotifier {
  PostModel() {
    init();
  }
  List<Post> postList = [];

  //todo ？
  final Stream<QuerySnapshot<Map<String, dynamic>>> _usersStream =
      FirebaseFirestore.instance.collection('postItem').snapshots();

  Future<void> fetchPostList() async {
    //todo ？
    Post toPost(DocumentSnapshot e) {
      final data = Map.from(e.data() as Map<String, String>);
      if (data != null) {
        return Post(
          message: data["message"],
          userId: data["userId"],
        );
      }
      return Post(userId: 'hahaha', message: "hello");
    }

    final snapShot =
        await FirebaseFirestore.instance.collection('postItem').get();
    postList = snapShot.docs.map((e) => toPost(e)).toList();
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
      'userId': FirebaseAuth.instance.currentUser?.uid,
      'message': _textEditingController.text,
    });
  }
}
