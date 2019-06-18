import 'package:flutter/material.dart';
import 'package:xforg_flutter_demo/Tabbar/TabBarBottomPageWidget.dart';
import 'package:xforg_flutter_demo/Tabbar/TabBarTopPageWidget.dart';
import 'package:xforg_flutter_demo/PullLoad/PullToRefreshWidge.dart';
import 'package:xforg_flutter_demo/PullLoad/PullOnLoadingWidge.dart';
import 'package:xforg_flutter_demo/SplashScreen/SplashScreen.dart';
import 'package:xforg_flutter_demo/Spinkit/SpinkitDemoPage.dart';
import 'package:xforg_flutter_demo/EventBus/screens/FirstScreen.dart';
import 'package:xforg_flutter_demo/EventBus/tools/bus.dart';
import 'package:xforg_flutter_demo/EventBus/events/Count_event.dart';

void main(){
  runApp(new MyApp());
  behaviorBus.fire(CountEvent(0));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter Demo",
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
            child: new Text("BotTabBar"),
          ),
          new FlatButton(onPressed: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new TabBarTopPageWidget()));
          },
            color: Colors.blue,
            child: new Text("TopTabBar"),
          ),
          new FlatButton(onPressed: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new PullToRefreshPage()));
          },
              color: Colors.blue,
              child: new Text("PullToLoad")
          ),
          new FlatButton(onPressed: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new PullOnLoadingPage()));
          }, 
              color: Colors.blue,
              child: new Text("PullOnLoad")),
          new FlatButton(onPressed: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new SplashScreen()));
          },
              color: Colors.blue,
              child: new Text("SplashScreen")),

          new FlatButton(onPressed: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new SpinkitPage()));
          },
              color: Colors.blue,
              child: new Text("SpinkitDemo")),
          new FlatButton(onPressed: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new FirstScreen()));
          },
              color: Colors.blue,
              child: new Text("EventBus")),
        ],
      ),
    );
  }
}
