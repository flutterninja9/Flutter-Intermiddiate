import 'dart:ui';

import 'package:weather_bloc_advanced/presentation/extensions/calendar.dart';
import 'package:weather_bloc_advanced/presentation/extensions/dashBoard.dart';
import 'package:weather_bloc_advanced/presentation/extensions/map.dart';
import 'package:weather_bloc_advanced/presentation/extensions/settings.dart';
import 'package:weather_bloc_advanced/presentation/extensions/stats.dart';

String API_KEY = "4236888987b54310b77232930200911";
Color primaryColor = Color.fromRGBO(97, 101, 247, 1);
Color textColor = Color.fromRGBO(50, 67, 99, 1);
String BASE_URL_CURRENTWEATHER =
    "https://api.weatherapi.com/v1/current.json?key=$API_KEY&q=";

Map dayName = {
  0: 'Sunday',
  1: 'Monday',
  2: 'Tuesday',
  3: 'Wednesday',
  4: 'Thursday',
  5: 'Friday',
  6: 'Saturday',
};

Map monthName = {
  1: 'January',
  2: 'February',
  3: 'March',
  4: 'April',
  5: 'May',
  6: 'June',
  7: 'July',
  8: 'August',
  9: 'September',
  10: 'October',
  11: 'November',
  12: 'December',
};

Map pageRoutes = {
  'dashboard': Dashboard(),
  'stats': Stats(),
  'map': Maps(),
  'calender': Calender(),
  'settings': Settings()
};
