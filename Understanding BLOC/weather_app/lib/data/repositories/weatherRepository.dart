import 'package:weather_app/data/data_provider/weatherProvider.dart';
import 'package:weather_app/data/models/weatherModel.dart';

Future<weatherModel> getWeather({String city}) async {
  Map<String, dynamic> unFormattedDatal = await getRawWeather(city: city);
  weatherModel model = weatherModel.fromJson(unFormattedDatal);
  return model;
}
