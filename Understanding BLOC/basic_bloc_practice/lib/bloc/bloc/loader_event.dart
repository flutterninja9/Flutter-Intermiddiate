part of 'loader_bloc.dart';

abstract class LoaderEvent extends Equatable {
  const LoaderEvent();

  @override
  List<Object> get props => [];
}

class LoadImage extends LoaderEvent {}
