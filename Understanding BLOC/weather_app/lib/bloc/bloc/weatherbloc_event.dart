part of 'weatherbloc_bloc.dart';

abstract class WeatherblocEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherblocEvent {
  final city;
  FetchWeather({@required this.city});

  @override
  List<Object> get props => [city];
}

class ResetWeather extends WeatherblocEvent {}
