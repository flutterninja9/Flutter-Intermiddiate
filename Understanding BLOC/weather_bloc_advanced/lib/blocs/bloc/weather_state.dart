part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class LoadingWeather extends WeatherState {}

class LoadingFailed extends WeatherState {}

class WeatherLoaded extends WeatherState {
  CurrentWeatherModel weather;
  WeatherLoaded({@required this.weather});

  CurrentWeatherModel get weatherCurrent => weather;

  @override
  List<Object> get props => [weather];
}
