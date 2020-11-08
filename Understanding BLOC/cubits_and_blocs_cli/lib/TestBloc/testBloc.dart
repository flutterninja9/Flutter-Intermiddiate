import 'package:bloc/bloc.dart';

enum CounterEvents { increment, decrement }

class TestBloc extends Bloc<CounterEvents, int> {
  TestBloc(initialState) : super(0);

  @override
  Stream<int> mapEventToState(event) async* {
    switch (event) {
      case CounterEvents.increment:
        yield state + 1;
        break;
      case CounterEvents.decrement:
        yield state - 1;
        break;
    }
  }
}
