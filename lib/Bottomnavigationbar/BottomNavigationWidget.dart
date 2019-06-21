import 'package:flutter/material.dart';
import 'package:xforg_flutter_demo/Bottomnavigationbar/pages/airplay_screen.dart';
import 'package:xforg_flutter_demo/Bottomnavigationbar/pages/email_screen.dart';
import 'package:xforg_flutter_demo/Bottomnavigationbar/pages/home_screen.dart';
import 'package:xforg_flutter_demo/Bottomnavigationbar/pages/pages_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {

  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;

  List<Widget> list = new List();

  @override
  void initState() {
    // TODO: implement initState
    list
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(AirPlayScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(
          icon: Icon(Icons.home,
          color: _bottomNavigationColor,
          ),
          title: new Text(
            'Home',
            style: TextStyle(color: _bottomNavigationColor),
          )
        ),
        new BottomNavigationBarItem(icon:Icon(
          Icons.email,
          color: _bottomNavigationColor,
        ),
          title: Text(
            'Email',
            style: TextStyle(color: _bottomNavigationColor),
          )
        ),
        new BottomNavigationBarItem(icon:
        Icon(Icons.pages,
        color: _bottomNavigationColor,
        ),
          title: Text(
            'PAGES',
            style: TextStyle(color: _bottomNavigationColor),
          )
        ),
        new BottomNavigationBarItem(icon:
        Icon(Icons.airplay,
        color: _bottomNavigationColor,
        ),
          title: Text(
            'AIRPLAY',
            style: TextStyle(color: _bottomNavigationColor),
          )
        ),
      ],
      currentIndex: _currentIndex,
        onTap: (int index){
        setState(() {
          _currentIndex = index;
        });
        },
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
