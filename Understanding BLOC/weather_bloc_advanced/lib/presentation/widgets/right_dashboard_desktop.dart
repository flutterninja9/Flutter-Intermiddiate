import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather_bloc_advanced/blocs/bloc/weather_bloc.dart';
import 'package:weather_bloc_advanced/controllers/navControllers.dart';
import 'package:weather_bloc_advanced/presentation/extensions/calendar.dart';
import 'package:weather_bloc_advanced/presentation/extensions/dashBoard.dart';
import 'package:weather_bloc_advanced/presentation/extensions/map.dart';
import 'package:weather_bloc_advanced/presentation/extensions/settings.dart';
import 'package:weather_bloc_advanced/presentation/extensions/stats.dart';

class RightBodyDesktop extends GetWidget<NavController> {
  List<Widget> pageModel = [
    Dashboard(),
    Stats(),
    Calender(),
    Settings(),
    Maps()
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() => pageModel[controller.pageCounter.value]);
  }
}
