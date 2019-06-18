import 'package:flutter/material.dart';
import 'package:xforg_flutter_demo/EventBus/events/Count_event.dart';
import 'package:xforg_flutter_demo/EventBus/screens/SecoundScreen.dart';
import 'package:xforg_flutter_demo/EventBus/tools/bus.dart';

class FirstScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("First Screen"),
      ),
      body: new Center(
        child: new StreamBuilder<CountEvent>(
          stream: behaviorBus.on<CountEvent>(),
            builder:(context,snapshot){
          return snapshot.hasData
              ? new Text('you pushed the button ${snapshot.data.count} times')
              : Text('waiting for data');
        }),
      ),
      floatingActionButton: new FloatingActionButton(onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new SecoundScreen())),
       child: new Icon(Icons.navigate_next),
     ),
    );
  }
}
