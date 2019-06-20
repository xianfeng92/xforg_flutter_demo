import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:xforg_flutter_demo/Common/Utils/common_utils.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xforg_flutter_demo/Common/Style/xforg_style.dart';
import 'package:xforg_flutter_demo/LocalizationAndTheme/redux/xforg_state.dart';
import 'package:xforg_flutter_demo/Common/Style/xforg_string_en.dart';

class HomeDrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new StoreBuilder<XFORGState>(
          builder: (context,store){
            return new Drawer(
              child: new Container(
                ///默认背景
                color: store.state.themeData.primaryColorDark,
                child: new SingleChildScrollView(
                  child: new Container(
                    constraints: new BoxConstraints(minHeight: MediaQuery.of(context).size.height),
                    child: new Material(
                      color: Color(XFORGColors.white),
                      child:new Column(
                        children: <Widget>[
                          new FlatButton(
                            child: new Text(
                              new XforgStringEn().home_change_theme,
                              style: XFORGConstant.normalText,
                            ),
                            onPressed: (){
                              showThemeDialog(context, store);
                            }),
                          new FlatButton(
                              child: new Text(
                                new XforgStringEn().home_change_language,
                                style: XFORGConstant.normalText,
                              ),
                              onPressed: (){
                                showLanguageDialog(context, store);
                              }),
                        ],
                      )
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }


  showLanguageDialog(BuildContext context, Store store) {
    List<String> list = [
      CommonUtils.getLocale(context).home_language_default,
      CommonUtils.getLocale(context).home_language_zh,
      CommonUtils.getLocale(context).home_language_en,
    ];
    CommonUtils.showCommitOptionDialog(context, list, (index) {
      CommonUtils.changeLocale(store, index);
    }, height: 150.0);
  }

  showThemeDialog(BuildContext context, Store store) {
    List<String> list = [
      CommonUtils.getLocale(context).home_theme_default,
      CommonUtils.getLocale(context).home_theme_1,
      CommonUtils.getLocale(context).home_theme_2,
      CommonUtils.getLocale(context).home_theme_3,
      CommonUtils.getLocale(context).home_theme_4,
      CommonUtils.getLocale(context).home_theme_5,
      CommonUtils.getLocale(context).home_theme_6,
    ];
    CommonUtils.showCommitOptionDialog(context, list, (index) {
      CommonUtils.pushTheme(store, index);
    }, colorList: CommonUtils.getThemeListColor());
  }
}
