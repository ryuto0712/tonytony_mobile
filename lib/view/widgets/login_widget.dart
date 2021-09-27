import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.07),
          Text(
            "Umay",
            style: TextStyle(
                fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.68),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    'ログイン',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
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
          TextButton(
            onPressed: () => null,
            child: Text(
              "ViP invite",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
