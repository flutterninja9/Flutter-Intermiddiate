import 'package:drak_mode_web/router_generator.dart';
import 'package:drak_mode_web/routers/app_router.dart';
import 'package:drak_mode_web/screens/secScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  //Routes.createRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple, canvasColor: Colors.white),
      darkTheme: ThemeData(
          primarySwatch: Colors.purple, canvasColor: Colors.grey[900]),
      themeMode: ThemeMode.light,
      initialRoute: '/home',
      onGenerateRoute: RouteGenerator.generateRoute,
      // navigatorKey: Routes.sailor.navigatorKey,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  bool _isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            icon: Icon(Icons.fast_forward),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Change Theme"),
          onPressed: () {
            _isDark = !_isDark;
            _isDark
                ? Get.changeThemeMode(ThemeMode.light)
                : Get.changeThemeMode(ThemeMode.dark);
          },
        ),
      ),
    );
  }
}
