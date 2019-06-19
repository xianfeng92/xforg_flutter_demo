import 'package:flutter/material.dart';
import 'package:xforg_flutter_demo/redux/UnderScreen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xforg_flutter_demo/redux/states/count_state.dart';

class TopScreen extends StatefulWidget {
  @override
  _TopScreenState createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Top Screen"),
      ),
      body: new Center(
        child:StoreConnector<CountState,int>(
            builder: (context,count) {
          return Text(
              count.toString(),
              style: Theme.of(context).textTheme.display1,);
        },
        converter: (store) => store.state.count),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
          return UnderScreen();
        }));
      },
        child: Icon(Icons.forward),
      ),
    );
  }
}
