import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/screens/home_screen.dart';

void main() {
  // Add the localization details in the entrypoint of your app

  runApp(EasyLocalization(
      child: MyApp(),
      supportedLocales: [Locale('en', 'US'), Locale('hi')],
      path: 'assets/translations'));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //Add these lines for initializing the Localiztion in the context
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        //End of localization lines
        title: 'Internationalization Demo',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
            canvasColor: Color.fromRGBO(18, 18, 18, 1),
            primaryColor: Colors.pink,
            accentColor: Colors.pinkAccent,
            primarySwatch: Colors.pink,
            textTheme: TextTheme(
                headline1: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w300),
                headline2: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    height: 2))),
        themeMode: ThemeMode.dark,
        home: Homescreen());
  }
}
