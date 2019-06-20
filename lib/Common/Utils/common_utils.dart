import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_statusbar/flutter_statusbar.dart';
import 'package:xforg_flutter_demo/Common/Style/xforg_style.dart';
import 'package:xforg_flutter_demo/Common/Style/xforg_string_base.dart';
import 'package:xforg_flutter_demo/Common/Localization/default_localizations.dart';
import 'package:xforg_flutter_demo/Common/Utils/navigator_utils.dart';
import 'package:xforg_flutter_demo/Common/Widget/XforgFlexButton.dart';
import 'package:xforg_flutter_demo/LocalizationAndTheme/redux/locale_redux.dart';
import 'package:xforg_flutter_demo/LocalizationAndTheme/redux/theme_redux.dart';
import 'package:xforg_flutter_demo/LocalizationAndTheme/redux/xforg_state.dart';

class CommonUtils {

  static final double MILLIS_LIMIT = 1000.0;

  static final double SECONDS_LIMIT = 60 * MILLIS_LIMIT;

  static final double MINUTES_LIMIT = 60 * SECONDS_LIMIT;

  static final double HOURS_LIMIT = 24 * MINUTES_LIMIT;

  static final double DAYS_LIMIT = 30 * HOURS_LIMIT;

  static double sStaticBarHeight = 0.0;

  static void initStatusBarHeight(context) async {
    sStaticBarHeight =
        await FlutterStatusbar.height / MediaQuery.of(context).devicePixelRatio;
  }

  static String getDateStr(DateTime date) {
    if (date == null || date.toString() == null) {
      return "";
    } else if (date.toString().length < 10) {
      return date.toString();
    }
    return date.toString().substring(0, 10);
  }

  static pushTheme(Store store, int index) {
    ThemeData themeData;
    List<Color> colors = getThemeListColor();
    themeData = getThemeData(colors[index]);
    store.dispatch(new RefreshThemeDataAction(themeData));
  }

  static getThemeData(Color color) {
    return ThemeData(primarySwatch: color, platform: TargetPlatform.android);
  }


  static XforgStringBase getLocale(BuildContext context) {
    return XforgLocalizations.of(context).currentLocalized;
  }

  static List<Color> getThemeListColor() {
    return [
      XFORGColors.primarySwatch,
      Colors.brown,
      Colors.blue,
      Colors.teal,
      Colors.amber,
      Colors.blueGrey,
      Colors.deepOrange,
    ];
  }

  ///列表item dialog
  static Future<Null> showCommitOptionDialog(
      BuildContext context,
      List<String> commitMaps,
      ValueChanged<int> onTap, {
        width = 250.0,
        height = 400.0,
        List<Color> colorList,
      }) {
    return NavigatorUtils.showGSYDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: new Container(
              width: width,
              height: height,
              padding: new EdgeInsets.all(4.0),
              margin: new EdgeInsets.all(20.0),
              decoration: new BoxDecoration(
                color: Color(XFORGColors.white),
                //用一个BoxDecoration装饰器提供背景图片
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              child: new ListView.builder(
                  itemCount: commitMaps.length,
                  itemBuilder: (context, index) {
                    return XforgFlexButton(
                      maxLines: 1,
                      mainAxisAlignment: MainAxisAlignment.start,
                      fontSize: 14.0,
                      color: colorList != null
                          ? colorList[index]
                          : Theme.of(context).primaryColor,
                      text: commitMaps[index],
                      textColor: Color(XFORGColors.white),
                      onPress: () {
                        Navigator.pop(context);
                        onTap(index);
                      },
                    );
                  }),
            ),
          );
        });
      }

  ///切换语言
  static changeLocale(Store<XFORGState> store, int index) {
    Locale locale = store.state.platformLocale;
    switch (index) {
      case 1:
        locale = Locale('zh', 'CH');
        break;
      case 2:
        locale = Locale('en', 'US');
        break;
    }
    store.dispatch(RefreshLocaleAction(locale));
  }

}
