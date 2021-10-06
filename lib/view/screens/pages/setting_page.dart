import 'package:flutter/material.dart';
import 'package:tonytony_mobile/view/screens/pages/profile_page.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
              child: Text('プロフィール'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('ログアウト'),
            ),
          ],
        ),
      ),
    );
  }
}
