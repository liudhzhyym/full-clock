import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:full_clock/models/home_model.dart';
import 'dart:convert';

class HomeBloc with ChangeNotifier {
  String _homeDataKey = "homeData";

  HomeModel _homeModel = HomeModel(fontColor: Colors.white);
  HomeModel get homeModel => _homeModel;

  HomeBloc() {
    SharedPreferences.getInstance().then((sp) {
      String homeData = sp.getString(_homeDataKey);
      if (homeData != null) {
        _homeModel = HomeModel.fromJSON(json.decode(homeData));
      }
      notifyListeners();
    });
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