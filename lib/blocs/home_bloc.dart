import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:full_clock/models/home_model.dart';
import 'dart:convert';
import 'package:battery/battery.dart';

class HomeBloc with ChangeNotifier {
  String _homeDataKey = "homeData";
  Battery _battery = Battery();
  int _batteryLevel = 100;
  int get batteryLevel => _batteryLevel;

  HomeModel _homeModel = HomeModel(fontColor: Colors.white);
  HomeModel get homeModel => _homeModel;

  HomeBloc() {
    _battery.onBatteryStateChanged.listen((BatteryState state) {
      updateBatteryLevel().then((result) {
        if (result) {
          notifyListeners();
        }
      });
    });
    Future.wait([
      loadData(),
      updateBatteryLevel()
    ]).then((result) {
      notifyListeners();
    });
  }

  Future loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String homeData = sp.getString(_homeDataKey);
    if (homeData != null) {
      _homeModel = HomeModel.fromJSON(json.decode(homeData));
    }
  }

  Future<bool> updateBatteryLevel() async {
    var tempLevel = await _battery.batteryLevel;
    if (tempLevel != _batteryLevel) {
      _batteryLevel = tempLevel;
      return Future.value(true);
    }
    return Future.value(false);
  }

  void changeFontColor(Color color) {
    if (color != null && color != _homeModel.fontColor) {
      _homeModel.fontColor = color;
      SharedPreferences.getInstance().then((sp) {
        sp.setString(_homeDataKey, json.encode(_homeModel.toJSON()));
        notifyListeners();
      });
    }
  }
}