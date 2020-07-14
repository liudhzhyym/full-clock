import 'dart:async';

import 'package:flutter/material.dart';
import 'package:only_clock/utils/sp_util.dart';

const String _fontColorData = "fontColorData";

class HomeBloc with ChangeNotifier {
  Color fontColor = Colors.white;

  HomeBloc() {
    Future.wait([
      initFontColor(),
    ]).then((result) {
      notifyListeners();
    });
  }

  Future initFontColor() async {
    var obj = await SpUtil.loadPreferences(_fontColorData);
    if (obj != null) {
      fontColor = Color(obj["fontColor"]);
    }
  }

  void changeFontColor(Color color) {
    if (color != null && color != fontColor) {
      fontColor = color;
      SpUtil.savePreferences(_fontColorData, {"fontColor": fontColor.value});
      notifyListeners();
    }
  }
}