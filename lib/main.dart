import 'package:flutter/material.dart';

import 'mine.dart';
import 'contacts.dart';
import 'home.dart';
import 'login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '欢迎来到Flutter',
      theme: new ThemeData(
        primaryColor: Colors.green
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        '/': (BuildContext context) => new Main(),
        '/login': (BuildContext context) => new Login()
      },
    );
  }
}

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainState();
}

class MainState extends State<Main> {
  int _selectedIndex = 0;

  List<Widget> pages = List<Widget>();

  @override
  void initState() {
    pages.add(Home());
    pages.add(Contacts());
    pages.add(Mine());
    super.initState();
  }
  

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('联系人')),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('我的')),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: pages[_selectedIndex],
    );
  }

}