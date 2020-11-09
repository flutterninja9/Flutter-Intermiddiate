import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/data/models/weatherModel.dart';
import 'package:weather_app/data/repositories/weatherRepository.dart';

part 'weatherbloc_event.dart';
part 'weatherbloc_state.dart';

class WeatherblocBloc extends Bloc<WeatherblocEvent, WeatherblocState> {
  WeatherblocBloc() : super(WeatherblocInitial());

  @override
  Stream<WeatherblocState> mapEventToState(
    WeatherblocEvent event,
  ) async* {
    if (event is FetchWeather) {
      yield WeatherLoading();
      try {
        weatherModel weather = await getWeather(city: event.city);
        yield Loaded(weather: weather);
      } catch (e) {
        yield LoadingFailed();
      }
    } else {
      yield WeatherblocInitial();
    }
  }
}
