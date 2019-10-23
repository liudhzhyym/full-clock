import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:full_clock/pages/home_page.dart';


var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
        HomePage());
