import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial());

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is Load) {
      yield Loading();
      await Future.delayed(Duration(seconds: 2));
      yield CounterInitial();
    } else {
      yield CounterInitial();
    }
  }
}
