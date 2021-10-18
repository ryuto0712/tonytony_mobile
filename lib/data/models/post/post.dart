import 'package:tonytony_mobile/data/models/user/user.dart';

class Post {
  Post({this.message, required this.userId, this.user});
  String? message;
  String userId;
  User? user;
}

class PostField {
  static const message = "message";
}
