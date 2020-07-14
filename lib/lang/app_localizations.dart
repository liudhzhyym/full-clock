import 'package:flutter/material.dart';
import 'package:only_clock/lang/en_us.dart';
import 'package:only_clock/lang/zh_cn.dart';

class AppLocalizations {
  static bool isZh = false;
  AppLocalizations(bool zh) {
    isZh = zh;
  }

  //Locale相关值
  static String of(String key) {
    return isZh ? ZhCN[key] : EnUS[key];
  }
}
