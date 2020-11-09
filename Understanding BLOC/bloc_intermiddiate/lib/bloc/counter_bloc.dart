import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterBlocState> {
  CounterBloc() : super(CounterBlocState(countValue: 0));

  @override
  Stream<CounterBlocState> mapEventToState(
    CounterEvent event,
  ) async* {
    switch (event) {
      case CounterEvent.increment:
        yield CounterBlocState(countValue: state.countValue + 1);
        break;

      case CounterEvent.decrement:
        yield CounterBlocState(countValue: state.countValue - 1);
        break;
    }
  }
}
