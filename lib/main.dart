import 'package:flutter/material.dart';
import 'package:xforg_flutter_demo/Tabbar/TabBarBottomPageWidget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter TabBar Demo",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainPage(),
    );
  }
}

class MainPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Demo TabBar"),
      ),
      body: new Column(
        children: <Widget>[
          new FlatButton(onPressed:(){
           Navigator.push(context,new MaterialPageRoute(builder:(context) => new TabBarBottomPageWidget()));
           },
            color: Colors.blue,
            child: new Text("Bottom tabBar"),
          ),
        ],
      ),
    );
  }
}
