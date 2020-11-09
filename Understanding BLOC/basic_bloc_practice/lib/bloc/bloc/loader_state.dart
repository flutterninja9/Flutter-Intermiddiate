part of 'loader_bloc.dart';

abstract class LoaderState extends Equatable {
  const LoaderState();

  @override
  List<Object> get props => [];
}

class LoaderInitial extends LoaderState {}

class ImageLoaded extends LoaderState {}

class LoadingImage extends LoaderState {}

class LoadingFailed extends LoaderState {}
