import 'dart:async';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_bloc_advanced/data/models/currentWeatherModel.dart';
import 'package:weather_bloc_advanced/data/repository/current_weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial());
  CurrentWeatherModel model;

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is SearchWeather) {
      yield LoadingWeather();
      try {
        model = await getWeather(city: event.city);
        yield WeatherLoaded(weather: model);
      } catch (e) {
        yield LoadingFailed();
      }
    } else {
      yield WeatherInitial();
    }
  }
}
