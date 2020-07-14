import 'package:flutter/material.dart';
import 'package:only_clock/utils/sp_util.dart';

const String _localeData = "localeData";

class UIBloc with ChangeNotifier {
  static Locale locale;

  UIBloc() {
    Future.wait([initLocale()]).then((_) {
      notifyListeners();
    });
  }

  Future initLocale() async {
    var obj = await SpUtil.loadPreferences(_localeData);
    if (obj != null) {
      var loc = Locale(obj["language"]);
      if (loc != locale) {
        locale = loc;
      }
    }
  }

  void changeLocale(Locale loc) {
    if (loc != locale) {
      locale = loc;
      SpUtil.savePreferences(_localeData, {"language": locale.languageCode});
      notifyListeners();
    }
  }

}