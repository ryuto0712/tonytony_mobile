import 'package:flutter/material.dart';
import 'package:tonytony_mobile/view/pages/activities_page.dart';
import 'package:tonytony_mobile/view/pages/chat_page.dart';
import 'package:tonytony_mobile/view/pages/home_page.dart';
import 'package:tonytony_mobile/view/pages/profile_page.dart';
import 'package:tonytony_mobile/view/pages/search_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Widget> _pages = [];
  int _currentIndex = 0;

  @override
  void initState() {
    _pages = const [
      HomePage(),
      SearchPage(),
      ChatPage(),
      ActivitiesPage(),
      ProfilePage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "activities",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "profile",
          ),
        ],
      ),
    );
  }
}
