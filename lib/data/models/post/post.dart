import 'package:tonytony_mobile/data/models/user/user.dart';

class Post {
  Post({this.message, required this.userId, this.user, this.id});
  String? message;
  String userId;
  User? user;
  String? id;
}

class PostField {
  static const message = "message";
}
