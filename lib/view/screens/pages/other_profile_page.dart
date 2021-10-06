import 'package:flutter/material.dart';

class OtherProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('プロフィール'),
      ),
      body: Column(
        children: [
          //プロフィール画像
          Text('太郎'),
          Text('こんにちはよろしくお願いします')
        ],
      ),
    );
  }
}
