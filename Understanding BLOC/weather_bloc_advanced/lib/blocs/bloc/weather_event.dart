part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchWeather extends WeatherEvent {
  String city;
  SearchWeather({@required this.city});

  @override
  List<Object> get props => [city];
}
