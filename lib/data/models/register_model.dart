import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final RegisterModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => RegisterModel());

class RegisterModel extends ChangeNotifier {
  //todo
  final titleController = TextEditingController();
  final authorController = TextEditingController();
}
