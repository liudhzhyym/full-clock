import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:full_clock/routes/app_router.dart';
import 'package:full_clock/blocs/application_bloc.dart';
import 'package:full_clock/blocs/home_bloc.dart';


void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]).then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: ApplicationBloc()),
          ChangeNotifierProvider.value(value: HomeBloc()),
        ],
        child: MyApp(),
      ),
    );
  });

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
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Full Clock',
      onGenerateRoute: AppRouter.router.generator,
    );
  }
}