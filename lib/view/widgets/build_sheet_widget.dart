import 'package:flutter/material.dart';

class BuildSheet extends StatelessWidget {
  const BuildSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,

      // appBar: AppBar(
      //   backgroundColor: Colors.white.withOpacity(0),
      //   elevation: 0,
      //   actions: <Widget>[
      //     IconButton(icon: Icon(Icons.add), onPressed: () => null),
      //   ],
      // ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width * 0.35,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: LinearGradient(
                colors: [Colors.pink, Colors.purple],
                begin: FractionalOffset.centerLeft,
                end: FractionalOffset.centerRight,
              ),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white.withOpacity(0),
              ),
              child: Text(
                'サインアップ',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
