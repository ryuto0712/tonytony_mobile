import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final registerModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => RegisterModel());

class RegisterModel extends ChangeNotifier {
  //RegisterModelが呼び出された段階で発動する
  //コンストラクタ（インスタンスが呼び出された時に発動。インスタンスとは、実態であり、クラスを呼び出すときに使用される）
  RegisterModel() {
    init();
    print('どうかな？？？？？');
  }

  TextEditingController _textEditingController = TextEditingController();
  get textEditingController => _textEditingController;
  TextEditingController _textEditingControllerPass = TextEditingController();
  get textEditingControllerPass => _textEditingControllerPass;

  void init() {
    _textEditingController.addListener(notifyListeners);
    _textEditingControllerPass.addListener(notifyListeners);
  }

  Future<bool> register() async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _textEditingController.text,
        password: _textEditingControllerPass.text,
      );

      // print(userCredential.user?.uid);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
