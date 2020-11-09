part of 'weatherbloc_bloc.dart';

abstract class WeatherblocState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherblocInitial extends WeatherblocState {}

class WeatherLoading extends WeatherblocState {}

class Loaded extends WeatherblocState {
  weatherModel weather;
  Loaded({@required this.weather});

  weatherModel get weatherScreenData => weather;

  @override
  List<Object> get props => [weather];
}

class LoadingFailed extends WeatherblocState {}
