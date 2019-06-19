import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xforg_flutter_demo/redux/states/count_state.dart';


class UnderScreen extends StatefulWidget {
  @override
  _UnderScreenState createState() => _UnderScreenState();
}

class _UnderScreenState extends State<UnderScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Under Screen"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<CountState,int>(
              converter: (store) => store.state.count,
              builder: (context,count){
                return new Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: StoreConnector<CountState,VoidCallback>(
          builder: (context,callback){
            return FloatingActionButton(
              onPressed: callback,
              child: Icon(Icons.add),
            );
          },
          converter: (store){
            return () => store.dispatch(Action.increment);
          }),
    );
  }
}
