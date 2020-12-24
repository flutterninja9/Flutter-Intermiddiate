import 'package:drak_mode_web/main.dart';
import 'package:drak_mode_web/screens/error_page.dart';
import 'package:drak_mode_web/screens/helpScreen.dart';
import 'package:drak_mode_web/screens/secScreen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting passed in arguments
    final args = settings.arguments;

    // Testing the got URL
    final url = Uri.parse(settings.name);
    String storeid = url.queryParameters['storeid'];
    print(storeid != null ? storeid : '');

    //Driver Code
    if (settings.name == "/home") {
      return MaterialPageRoute(builder: (_) => MyHomePage());
    } else if (settings.name.contains('/help')) {
      return MaterialPageRoute(
          builder: (_) => Help(
                storeID: storeid,
              ));
    } else {
      return MaterialPageRoute(builder: (_) => ErrorPage());
    }
  }
}
