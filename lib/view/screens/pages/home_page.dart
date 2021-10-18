import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tonytony_mobile/data/models/post/post_model.dart';
import 'package:tonytony_mobile/view/screens/pages/setting_page.dart';

class HomePage extends HookWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = useProvider(postModelProvider)..init();
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
          //ListView.builderの方がパフォーマンスが良いとされている（スクロールして要素が必要になったらその分だけ読み込まれるから）
          child: ListView.builder(
        itemCount: model.postList.length,
        itemBuilder: (BuildContext context, int index) {
          final post = model.postList[index];
          return Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 6,
                    offset: Offset(1, 1),
                  )
                ]),
            child: ListTile(
              title: Text(post.message ?? "ヌルです"),
              subtitle: Text(post.user?.userName ?? "ヌルです"),
              leading: Image.network(post.user?.userIcon ?? ""),
              onLongPress: () {
                showDialog(
                    context: context,
                    //todo contextにはここまでの履歴（必要な情報）が全て詰まっている
                    builder: (context) {
                      return AlertDialog(
                        content: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red, //ボタンの背景色
                                  ),
                                  onPressed: () async {
                                    //post()が発動してデータベースに追加しているが、それだけだとListView.Builderに反映されなくない？
                                    await model.deletePost(post.id);
                                    Navigator.pop(context);

                                    print(
                                        FirebaseAuth.instance.currentUser?.uid);
                                  },
                                  child: Text('削除')),
                              SizedBox(
                                width: 30,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue, //ボタンの背景色
                                  ),
                                  onPressed: () {
                                    model.textEditingController.text =
                                        post.message ?? "";
                                    //post()が発動してデータベースに追加しているが、それだけだとListView.Builderに反映されなくない？
                                    showDialog(
                                        context: context,
                                        //todo contextにはここまでの履歴（必要な情報）が全て詰まっている
                                        builder: (context) {
                                          return TwitterDialog(
                                            model: model,
                                            selected: post.id,
                                          );
                                        });
                                  },
                                  child: Text('編集'))
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              //todo contextにはここまでの履歴（必要な情報）が全て詰まっている
              builder: (context) {
                return TwitterDialog(model: model);
              });
        },
        child: Text('+'),
      ),
    );
  }
}

class TwitterDialog extends StatelessWidget {
  TwitterDialog({
    required this.model,
    this.selected,
  });

  final PostModel model;
  final String? selected;

  @override
  Widget build(BuildContext context) {
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
                  //post()が発動してデータベースに追加しているが、それだけだとListView.Builderに反映されなくない？
                  await model.update(selected);
                  Navigator.pop(context);
                  print(FirebaseAuth.instance.currentUser?.uid);
                },
                child: Text('投稿'))
          ],
        ),
      ),
    );
  }
}

// showDialog(
// context: context,
// //todo contextにはここまでの履歴（必要な情報）が全て詰まっている
// builder: (context) {
// return AlertDialog(
// content: SizedBox(
// height: MediaQuery.of(context).size.height * 0.2,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// TextFormField(
// controller: model.textEditingController,
// keyboardType: TextInputType.multiline,
// decoration: InputDecoration(
// contentPadding: new EdgeInsets.symmetric(
// vertical: 25.0, horizontal: 10.0),
// border: OutlineInputBorder())),
// ElevatedButton(
// onPressed: () async {
// //post()が発動してデータベースに追加しているが、それだけだとListView.Builderに反映されなくない？
// await model.post();
// print(FirebaseAuth.instance.currentUser?.uid);
// },
// child: Text('投稿'))
// ],
// ),
// ),
// );
// });
