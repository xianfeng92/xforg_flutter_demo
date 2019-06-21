import 'package:flutter/material.dart';
import 'package:xforg_flutter_demo/PullLoad/PullToRefreshWidge.dart';
import 'package:xforg_flutter_demo/PullLoad/PullOnLoadingWidge.dart';
import 'package:xforg_flutter_demo/SplashScreen/SplashScreen.dart';
import 'package:xforg_flutter_demo/Spinkit/SpinkitDemoPage.dart';
import 'package:xforg_flutter_demo/EventBus/screens/FirstScreen.dart';
import 'package:xforg_flutter_demo/SearchBar/SearchBarPage.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xforg_flutter_demo/LocalizationAndTheme/ThemeChangePage.dart';
import 'package:xforg_flutter_demo/LocalizationAndTheme/redux/xforg_state.dart';
import 'package:xforg_flutter_demo/Common/Utils/common_utils.dart';
import 'package:xforg_flutter_demo/Common/Style/xforg_style.dart';
import 'package:xforg_flutter_demo/Common/Localization/XforgLocalizationsDelegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Bottomnavigationbar/BottomNavigationWidget.dart';


void main(){
  final store = Store<XFORGState>(
      appReducer,
      initialState:new XFORGState(CommonUtils.getThemeData(XFORGColors.primarySwatch),Locale('zh', 'CH')));
  runApp(new MyApp(store));
}

class MyApp extends StatelessWidget {

  final Store<XFORGState> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<XFORGState>(
      store:store,
      child: new StoreBuilder<XFORGState>(builder: (context,store){
        return new MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            XFORGLocalizationsDelegate.delegate,
          ],
          locale: store.state.locale,
          supportedLocales: [store.state.locale],
          theme:store.state.themeData,
          home: new XFORGLocalizations(
            child:pageContainer(new MainPage()),
          )
        );
      })
    );
  }
}

class XFORGLocalizations extends StatefulWidget {
  
  final Widget child;
  
  XFORGLocalizations({Key key,this.child}):super(key:key);
  
  @override
  _XFORGLocalizationsState createState() => _XFORGLocalizationsState();
}

class _XFORGLocalizationsState extends State<XFORGLocalizations> {

  @override
  Widget build(BuildContext context) {
    return new StoreBuilder<XFORGState>(
        builder: (context,store){
          return new Localizations.override(
            context: context,
            locale: store.state.locale,
            child: widget.child,
          );
        },
    );
  }
}

///Page页面的容器，做一次通用自定义
Widget pageContainer(widget) {
return MediaQuery(
///不受系统字体缩放影响
data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
    .copyWith(textScaleFactor: 1), child: widget);
}

class MainPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Demo TabBar"),
      ),
      body: new WillPopScope(
          child:       new Column(
            children: <Widget>[
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
                  child: new Text("EventBusDemo")),
              new FlatButton(onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new SearchBarPage()));
              },
                  color: Colors.blue,
                  child: new Text("SearchBarDemo")),
              new FlatButton(onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomeDrawerPage()));
              },
                  color: Colors.blue,
                  child: new Text("changeTheme")),
              new FlatButton(onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new BottomNavigationWidget()));
              },
                  color: Colors.blue,
                  child: new Text("BottomNavigation")),
            ],
          ),
          onWillPop: (){
            return _dialogExitApp(context);
          })
    );
  }

  Future<bool> _dialogExitApp(BuildContext context){
    return showDialog(
        context: context,
      builder: (context) => new AlertDialog(
        content: new Text("是否退出？"),
        actions: <Widget>[
          new FlatButton(onPressed:() => Navigator.of(context).pop(false), child: new Text('取消')),
          new FlatButton(onPressed: () => Navigator.of(context).pop(true), child: new Text("确定"))
        ],
      )
    );
  }
}
