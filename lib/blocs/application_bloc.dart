import 'package:flutter/material.dart';

class ApplicationBloc with ChangeNotifier {
  bool _blackMode = false;

  bool get blackMode => _blackMode;

  void changeBlackMode(bool mode) {
    if (mode != null && mode != _blackMode) {
      _blackMode = mode;
      notifyListeners();
    }
  }
}