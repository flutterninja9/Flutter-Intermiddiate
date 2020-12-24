import 'dart:js';

import 'package:drak_mode_web/main.dart';
import 'package:drak_mode_web/screens/helpScreen.dart';
import 'package:drak_mode_web/screens/secScreen.dart';
import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';

class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoute(SailorRoute(
        name: '/secondscreen',
        params: [
          SailorParam<String>(name: 'data', defaultValue: 'Hello Flutter!'),
        ],
        builder: (context, args, param) {
          return SecondScreen(data: 'Welomce to Screen-02');
        }));

    sailor.addRoute(SailorRoute(
        name: '/help',
        builder: (context, args, param) {
          print(args);
          return Help();
        }));
  }
}
