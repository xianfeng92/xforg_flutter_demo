import 'package:flutter/material.dart';

class XFTabBarWidge extends StatefulWidget{

  static const int BOTTOM_TAB = 1;

  static const int TOP_TAB = 2;

  final int type;

  final List<Widget> tabItems;

  final List<Widget> tavViews;

  final Color backgroundColor;

  final Color indicatorColor;

  final Widget title;

  final Widget drawer;

  final Widget floatingActionButton;

  final TarWidgetControl tarWidgetControl;

  final PageController topPageControl;

  XFTabBarWidge({
    Key key,
    this.type,
    this.tabItems,
    this.tavViews,
    this.backgroundColor,
    this.indicatorColor,
    this.title,
    this.drawer,
    this.floatingActionButton,
    this.tarWidgetControl,
    this.topPageControl
}):super(key:key);

  @override
  _XFTabBarState createState() =>
      new _XFTabBarState(type, tabItems, tavViews, backgroundColor, indicatorColor, title, drawer, floatingActionButton, topPageControl);
}

class _XFTabBarState extends State<XFTabBarWidge> with SingleTickerProviderStateMixin{

  final int _type;

  final List<Widget> _tabItems;

  final List<Widget> _tabViews;

  final Color _backGroundColor;

  final Color _indicatorColor;

  final Widget _title;

  final Widget _drawer;

  final Widget _floatingActionButton;

  final PageController _pageController;

  _XFTabBarState(this._type,this._tabItems,this._tabViews,this._backGroundColor,this._indicatorColor,this._title,this._drawer,this._floatingActionButton,this._pageController):super();

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /// 初始化时创建控制器
    /// 通过 with SingleTickerProviderStateMixin 实现动画效果
    _tabController = new TabController(length: _tabItems.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    ///页面销毁时，销毁控制器
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ///底部TAbBar模式
    if(this._type == XFTabBarWidge.TOP_TAB){
      return new Scaffold(
        ///设置侧边滑出 drawer，不需要可以不设置
        drawer: _drawer,
        ///标题栏
        appBar: new AppBar(
          backgroundColor: _backGroundColor,
          title: _title,
          ///顶部tab是放在 AppBar 的 bottom 中，也就是标题栏之下
          bottom: new TabBar(tabs: _tabItems,
          isScrollable: true,
            controller: _tabController,
            indicatorColor: _indicatorColor,
          ),
        ),
        body:new PageView(
          ///必须有的控制器，与tabBar的控制器同步
          controller: _pageController,
          children: _tabViews,
          ///页面触摸作用滑动回调，用于同步tab选中状态
          onPageChanged: (index){
            _tabController.animateTo(index);
          },
        ) ,
      );
    }
    return new Scaffold(
      drawer: _drawer,
      floatingActionButton: _floatingActionButton,
      appBar: new AppBar(
        backgroundColor: _backGroundColor,
        title: _title,
      ),
      body: new PageView(
        controller: _pageController,
        children:_tabViews,
        onPageChanged: (index){
          _tabController.animateTo(index);
        },
      ),
      ///底部tab是放在了 Scaffold 的 bottomNavigationBar 中
      bottomNavigationBar: new Material(
        color: _backGroundColor,
        child: new TabBar(tabs: _tabItems,
        controller: _tabController,
        indicatorColor: _indicatorColor,
        ),
      ),
    );
  }
}

class TarWidgetControl {
  List<Widget> footerButton = [];
}