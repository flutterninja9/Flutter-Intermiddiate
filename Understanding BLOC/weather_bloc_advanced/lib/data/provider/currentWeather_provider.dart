import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_bloc_advanced/helpers/constants.dart';

getRawCurrentWeather({city}) async {
  Response response = await get(BASE_URL_CURRENTWEATHER + city);
  print("Response from provider:");
  Map<String, dynamic> result = jsonDecode(response.body);
  print(result);
  return result;
}
