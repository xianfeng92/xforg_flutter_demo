import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:xforg_flutter_demo/Common/Style/xforg_string_base.dart';
import 'package:xforg_flutter_demo/Common/Style/xforg_string_en.dart';
import 'package:xforg_flutter_demo/Common/Style/xforg_string_zh.dart';

///自定义多语言实现
class XforgLocalizations {

  final Locale locale;

  XforgLocalizations(this.locale);

  ///根据不同 locale.languageCode 加载不同语言对应
  ///XforgStringEn 和 XforgStringZh 都继承了 XforgStringBase
  static Map<String, XforgStringBase> _localizedValues = {
    'en': new XforgStringEn(),
    'zh': new XforgStringZh(),
  };

  XforgStringBase get currentLocalized {
    return _localizedValues[locale.languageCode];
  }

  ///通过 Localizations 加载当前的 XforgLocalizations
  ///获取对应的 XforgLocalizations
  static XforgLocalizations of(BuildContext context) {
    return Localizations.of(context, XforgLocalizations);
  }
}
