import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginModelProvider =
//　　　　　　　　　　　　　　　　　　　　　　　　　　　　　インスタンス化
    ChangeNotifierProvider.autoDispose((ref) => LoginModel());

class LoginModel extends ChangeNotifier {
  //コンストラクタ
  LoginModel() {
    init();
  }
  TextEditingController _textEditingController = TextEditingController();
  get textEditingController => _textEditingController;
  TextEditingController _textEditingControllerPass = TextEditingController();
  get textEditingControllerPass => _textEditingControllerPass;

  void init() {
    _textEditingController.addListener(notifyListeners);
    _textEditingControllerPass.addListener(notifyListeners);
  }

//try catch文を使わないとエラーになる。
  Future<bool> login() async {
    //todo userCredentialって何？
    try {
      final userCredential = FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _textEditingController.text,
          password: _textEditingControllerPass.text);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
