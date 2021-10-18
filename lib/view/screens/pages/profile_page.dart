import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tonytony_mobile/data/models/user/profile_model.dart';

class ProfilePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final model = useProvider(profileModelProvider)..init();
    return Scaffold(
      appBar: AppBar(
        title: Text('プロフィール'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: model.userNameController,
          ),
          Text(model.userNameController.text ?? ""),
          TextFormField(
            controller: model.profileController,
          ),
          Text(model.profileController.text ?? ""),
          ElevatedButton(onPressed: () {}, child: Text('保存'))
        ],
      ),
    );
  }
}
