import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:only_clock/blocs/ui_bloc.dart';
import 'package:only_clock/lang/app_localizations_delegate.dart';
import 'package:provider/provider.dart';

import 'package:only_clock/routes/app_router.dart';
import 'package:only_clock/blocs/application_bloc.dart';
import 'package:only_clock/blocs/home_bloc.dart';
import 'package:wakelock/wakelock.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UIBloc()),
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
    // Prevent screen from going into sleep mode
    Wakelock.enable();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OnlyClock',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizationsDelegate()
      ],
      supportedLocales: [
        Locale('zh'),
        Locale('en'),
      ],
      locale: UIBloc.locale,
      localeListResolutionCallback: (locales, supportedLocales) {
        if (locales.length > 0) {
          var isSupportZH = false;
          for (var loc in locales) {
            if (loc.languageCode == 'zh') {
              isSupportZH = true;
              break;
            }
          }
          if (isSupportZH) {
            UIBloc.locale = Locale('zh');
          } else {
            UIBloc.locale = Locale('en');
          }
          return UIBloc.locale;
        }
        return null;
      },
      onGenerateRoute: AppRouter.router.generator,
    );
  }
}