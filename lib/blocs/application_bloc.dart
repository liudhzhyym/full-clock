import 'dart:async';

import 'package:flutter/material.dart';
import 'package:battery/battery.dart';

class ApplicationBloc with ChangeNotifier {
  Battery _battery = Battery();
  DateTime dateTime = DateTime.now();
  int batteryLevel = 100;

  ApplicationBloc() {
    _updateBatteryLevel();
    Timer.periodic(Duration(seconds: 1), _updateTime);
    _battery.onBatteryStateChanged.listen((BatteryState state) {
      _updateBatteryLevel();
    });
  }

  setBatteryLevel(v) {
    if (v != batteryLevel) {
      batteryLevel = v;
      notifyListeners();
    }
  }

  _updateBatteryLevel() {
    _battery.batteryLevel.then((v) {
      setBatteryLevel(v);
    });
  }

  void _updateTime(Timer timer) {
    dateTime = DateTime.now();
    notifyListeners();
  }
}