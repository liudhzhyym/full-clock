import 'package:flutter/material.dart';

class HomeModel {
  Color fontColor;

  HomeModel({
    this.fontColor,
  });

  HomeModel.fromJSON(Map<String, dynamic> json)
      : fontColor = Color(json['fontColor']);

  Map<String, dynamic> toJSON() => {
    'fontColor': fontColor.value
  };
}