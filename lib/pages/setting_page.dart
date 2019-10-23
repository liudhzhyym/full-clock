import 'dart:async';
import 'package:flutter/material.dart';
import 'package:full_clock/utils/screen_util.dart';


class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> with ScreenUtil {

  @override
  Widget build(BuildContext context) {
    initScreenUtil(context, width: 750, height: 1344);
    return Scaffold(
      appBar: new AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center()
    );
  }
}