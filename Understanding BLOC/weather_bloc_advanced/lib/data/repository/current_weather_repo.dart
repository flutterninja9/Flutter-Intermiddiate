import 'package:weather_bloc_advanced/data/models/currentWeatherModel.dart';
import 'package:weather_bloc_advanced/data/provider/currentWeather_provider.dart';

Future<CurrentWeatherModel> getWeather({city}) async {
  Map<String, dynamic> tempWeather = await getRawCurrentWeather(city: city);
  CurrentWeatherModel weather = CurrentWeatherModel.fromJson(tempWeather);
  return weather;
}
