import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loader_event.dart';
part 'loader_state.dart';

class LoaderBloc extends Bloc<LoaderEvent, LoaderState> {
  LoaderBloc() : super(LoaderInitial());

  @override
  Stream<LoaderState> mapEventToState(
    LoaderEvent event,
  ) async* {
    if (event is LoadImage) {
      yield LoadingImage();

      await Future.delayed(Duration(seconds: 2));

      yield ImageLoaded();
    } else {
      yield LoadingFailed();
    }
  }
}
