import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/data/constants.dart';

getRawWeather({String city}) async {
  String url = "http://api.openweathermap.org/data/2.5/weather?q=" +
      city +
      "&appid=$API_KEY";
  Response response = await get(url);
  Map<String, dynamic> data = jsonDecode(response.body);
  print(data);
  return data;
}
