import 'package:flutter/material.dart';
import 'package:xforg_flutter_demo/Tabbar/XFTabBarWidget.dart';
import 'package:xforg_flutter_demo/Tabbar/TabBarPageFirst.dart';
import 'package:xforg_flutter_demo/Tabbar/TabBarPageSecond.dart';
import 'package:xforg_flutter_demo/Tabbar/TabBarPageThree.dart';

class TabBarBottomPageWidget extends StatefulWidget {
  @override
  _TabBarBottomPageWidgetState createState() => _TabBarBottomPageWidgetState();
}

class _TabBarBottomPageWidgetState extends State<TabBarBottomPageWidget> {

  final PageController topPageControl = new PageController();

  final List<String> tab = ["动态","趋势","我的"];

  ///渲染底部Tab
  _renderTab(){
    List<Widget> list = new List();
    for(int i = 0; i < tab.length; i++){
      list.add(new FlatButton(
          onPressed: (){
            ///每个 Tabbar 点击时，通过jumpTo 跳转页面
            ///每个页面需要跳转坐标为：当前屏幕大小 * 索引index
        topPageControl.jumpTo(MediaQuery.of(context).size.width*i);},
          child: new Text(
        tab[i],
        maxLines: 2,))
      );
    }
    return list;
  }

  ///渲染Tab对应页面
  _renderPage(){
    return [
      new TabBarPageFirst(),
      new TabBarPageSecond(),
      new TabBarPageThree(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new XFTabBarWidge(type: XFTabBarWidge.BOTTOM_TAB,
     tabItems: _renderTab(),
     tavViews: _renderPage(),
     topPageControl: topPageControl,
     backgroundColor: Colors.blue,
     indicatorColor: Colors.redAccent,
     title: new Text("XFTabBarWidge"),
    );
  }

}
