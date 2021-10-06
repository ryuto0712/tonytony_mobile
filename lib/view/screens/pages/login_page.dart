import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tonytony_mobile/data/models/login_model.dart';
import 'package:tonytony_mobile/view/screens/home_screen.dart';
import 'package:tonytony_mobile/view/screens/pages/register_page.dart';

class LoginPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final login_model = useProvider(loginModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: login_model.textEditingController,
          ),
          TextFormField(
            controller: login_model.textEditingControllerPass,
          ),
          Text("${login_model.textEditingController.text}"),
          Text("${login_model.textEditingControllerPass.text}"),
          ElevatedButton(
              onPressed: () async {
                final result = await login_model.login();
                if (result) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                }
              },
              child: Text("ログイン")),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterPage(),
                ),
              );
            },
            child: Text("新規登録の方はこちら"),
          )
        ],
      ),
    );
  }
}
