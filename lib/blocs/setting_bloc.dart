import 'package:flutter/material.dart';

class HomeBloc with ChangeNotifier {
  int _fontColor = 0;

  int get fontColor => _fontColor;

  void changeFontColor(int color) {
    if (color != null && color != _fontColor) {
      _fontColor = color;
      notifyListeners();
    }
  }
}