import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:full_clock/routes/app_router.dart';
import 'package:full_clock/blocs/application_bloc.dart';
import 'package:full_clock/blocs/home_bloc.dart';
import 'package:screen/screen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ApplicationBloc()),
        ChangeNotifierProvider.value(value: HomeBloc()),
      ],
      child: MyApp(),
    ),
  );

  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  _MyAppState() {
    Routes.configureRoutes();
  }

  @override
  void initState() {
    super.initState();
    // Prevent screen from going into sleep mode:
    Screen.keepOn(true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '嘿钟',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRouter.router.generator,
    );
  }
}