import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xforg_flutter_demo/Common/Localization/default_localizations.dart';

///多语言代理
class XFORGLocalizationsDelegate extends LocalizationsDelegate<XforgLocalizations>{

  XFORGLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    ///支持中文和英语
    return ['en', 'zh'].contains(locale.languageCode);
  }


  @override
  Future<XforgLocalizations> load(Locale locale) {
    return new SynchronousFuture<XforgLocalizations>(new XforgLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<XforgLocalizations> old) {
    // TODO: implement shouldReload
    return false;
  }

  static XFORGLocalizationsDelegate delegate = new XFORGLocalizationsDelegate();
}