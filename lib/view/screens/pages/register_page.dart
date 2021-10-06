import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tonytony_mobile/data/models/register_model.dart';
import 'package:tonytony_mobile/view/screens/home_screen.dart';
import 'package:tonytony_mobile/view/screens/pages/login_page.dart';

class RegisterPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final register_model = useProvider(registerModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('新規登録'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: register_model.textEditingController,
          ),
          TextFormField(
            controller: register_model.textEditingControllerPass,
          ),
          Text("${register_model.textEditingController.text}"),
          Text("${register_model.textEditingControllerPass.text}"),
          ElevatedButton(
              onPressed: () async {
                final result = await register_model.register();
                if (result) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                }
              },
              child: Text("新規登録")),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
            child: Text("登録済みの方はこちら"),
          )
        ],
      ),
    );
  }
}
