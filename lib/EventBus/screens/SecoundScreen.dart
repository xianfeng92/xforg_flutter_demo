import 'package:flutter/material.dart';
import 'package:xforg_flutter_demo/EventBus/tools/bus.dart';
import 'package:xforg_flutter_demo/EventBus/events/Count_event.dart';

class SecoundScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<CountEvent>(
        stream: behaviorBus.on<CountEvent>(),
        builder:(context,snapshot){
          return new Scaffold(
            appBar: new AppBar(
              title: new Text("Secound Screen"),
            ),
            body: new Center(
              child: snapshot.hasData
              ? Text('you pushed the button ${snapshot.data.count} times')
                  :Text('waiting for data'),
            ),
            floatingActionButton: new FloatingActionButton(onPressed: (){
              if(snapshot.hasData){
                behaviorBus.fire(CountEvent(snapshot.data.count+1));
              }
            },
            child: Icon(Icons.add),
            ),
          );
        }
    );
  }
}
