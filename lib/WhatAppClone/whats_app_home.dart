import 'package:flutter/material.dart';
import 'package:xforg_flutter_demo/WhatAppClone/pages/call_screen.dart';
import 'package:xforg_flutter_demo/WhatAppClone/pages/status_screen.dart';
import 'package:xforg_flutter_demo/WhatAppClone/pages/chat_screen.dart';


class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> with SingleTickerProviderStateMixin,WidgetsBindingObserver {

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 3, vsync: this,initialIndex: 1);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.resumed){
      print("AppLifecycleState.resumed");
    }else if (state == AppLifecycleState.paused){
      print("AppLifecycleState.paused");
    }else if(state == AppLifecycleState.inactive){
      print("AppLifecycleState.inactive");
    }else if (state == AppLifecycleState.suspending){
      print("AppLifecycleState.suspending");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("WhatsApp"),
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(text: "CHATS"),
            new Tab(text: "STATUS"),
            new Tab(text: "CHAT"),
          ],
        ),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0)),
          new Icon(Icons.more_vert),
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new ChatScreen(),
          new StatusScreen(),
          new CallsScreen(),
        ],
      ),
      floatingActionButton:new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () => print("open chats") ,
      ),
    );
  }
}
