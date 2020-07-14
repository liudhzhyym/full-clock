import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:only_clock/lang/app_localizations.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(
        AppLocalizations(locale.languageCode == "zh"));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
