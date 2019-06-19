import 'package:flutter/material.dart';
import 'package:xforg_flutter_demo/HomeDrawer/redux/theme_redux.dart';

///全局Redux store 的对象，保存State数据
class XFORGState {

  ///主题数据
  ThemeData themeData;

  ///构造方法
  XFORGState(this.themeData);
}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store
XFORGState appReducer(XFORGState state, action) {
  return XFORGState(
    ///通过 ThemeDataReducer 将 GSYState 内的 themeData 和 action 关联在一起
    ThemeDataReducer(state.themeData,action),
  );
}