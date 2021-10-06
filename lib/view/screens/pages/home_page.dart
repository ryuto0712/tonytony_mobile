import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:tonytony_mobile/data/models/post/post_model.dart';
import 'package:tonytony_mobile/view/screens/pages/setting_page.dart';

class HomePage extends HookWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = useProvider(postModelProvider);
    final post_model = useProvider(postModelProvider)..init();
    // ..fetchPostList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingPage(),
                  ),
                );
              },
              icon: Icon(Icons.menu)),
        ],
      ),
      body: Center(
          child: ListView.builder(
        itemCount: post_model.postList.length,
        itemBuilder: (BuildContext context, int index) {
          final post = post_model.postList[index];
          return ListTile(
            title: Text(post.message ?? ""),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                            controller: model.textEditingController,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                contentPadding: new EdgeInsets.symmetric(
                                    vertical: 25.0, horizontal: 10.0),
                                border: OutlineInputBorder())),
                        ElevatedButton(
                            onPressed: () async {
                              await model.post();
                            },
                            child: Text('投稿'))
                      ],
                    ),
                  ),
                );
              });
        },
        child: Text('+'),
      ),
    );
  }
}
