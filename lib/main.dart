import 'package:flutter/material.dart';
import 'package:xforg_flutter_demo/Bottomnavigationbar/navigation_keep_alive.dart';
import 'package:xforg_flutter_demo/Clipper/custome_clipper.dart';
import 'package:xforg_flutter_demo/CustomRouterTransition/pages.dart';
import 'package:xforg_flutter_demo/Expansion/expansion_title.dart';
import 'package:xforg_flutter_demo/PullLoad/PullToRefreshWidge.dart';
import 'package:xforg_flutter_demo/PullLoad/PullOnLoadingWidge.dart';
import 'package:xforg_flutter_demo/Sliver/sliver_screen.dart';
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
import 'package:xforg_flutter_demo/WhatAppClone/whats_app_home.dart';

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
    // TODO: implement build
    Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Demo TabBar"),
      ),
      body: new WillPopScope(
          child: new Center(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading:new Icon(Icons.label_outline),
                  title:Text("PullToLoad",style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)) ,
                  onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new PullToRefreshPage())),
                ),
                ListTile(
                  leading:new Icon(Icons.label_outline),
                  title:Text("PullOnLoad",style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)) ,
                  onTap: () =>  Navigator.push(context, new MaterialPageRoute(builder: (context) => new PullOnLoadingPage())),
                ),
                ListTile(
                  leading:new Icon(Icons.label_outline),
                  title:Text("SplashScreen",style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)) ,
                  onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new SplashScreen())),
                ),
                ListTile(
                  leading:new Icon(Icons.label_outline),
                  title:Text("FirstScreen",style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)) ,
                  onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new FirstScreen())),
                ),
                ListTile(
                  leading:new Icon(Icons.label_outline),
                  title:Text("SpinkitPage",style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)) ,
                  onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new SpinkitPage())),
                ),
                ListTile(
                  leading:new Icon(Icons.label_outline),
                  title:Text("SearchBarPage",style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)) ,
                  onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new SearchBarPage())),
                ),
                ListTile(
                  leading:new Icon(Icons.label_outline),
                  title:Text("ChangeTheme",style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)) ,
                  onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomeDrawerPage())),
                ),
                ListTile(
                  leading:new Icon(Icons.label_outline),
                  title:Text("BottomNavigation",style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)) ,
                  onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new NavigationKeepAlive())),
                ),
                ListTile(
                  leading:new Icon(Icons.label_outline),
                  title:Text("CustomRouter",style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)) ,
                  onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new FirstPage())),
                ),
                ListTile(
                  leading:new Icon(Icons.label_outline),
                  title:Text("ExpansionTile",style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)) ,
                  onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new ExpansionTileDemo())),
                ),
                ListTile(
                  leading:new Icon(Icons.label_outline),
                  title:Text("SliverScreen",style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)) ,
                  onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new SliverScreen())),
                ),
                ListTile(
                  leading:new Icon(Icons.label_outline),
                  title:Text("CustomClipper",style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)) ,
                  onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage())),
                ),
                ListTile(
                  leading:new Icon(Icons.label_outline),
                  title:Text("BottomNavigation",style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)) ,
                  onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new NavigationKeepAlive())),
                ),
                ListTile(
                  leading:new Icon(Icons.label_outline),
                  title:Text("WhatsAppHome",style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)) ,
                  onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new WhatsAppHome())),
                ),
              ],
            ),
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
