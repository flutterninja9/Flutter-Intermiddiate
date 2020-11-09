import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weatherModel.dart';

class ShowWeatherScreen extends StatelessWidget {
  weatherModel weather;
  String city;

  ShowWeatherScreen({@required this.city, @required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(weather.main.tempMax.toString()),
      ],
    );
  }
}
