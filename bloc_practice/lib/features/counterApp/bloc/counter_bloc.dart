import 'package:bloc/bloc.dart';

enum CounterEvents { increment, decrement }

class CounterCubit extends Cubit<int> {
  CounterCubit(state) : super(0);

  increment() => emit(state + 1);
  decrement() => emit(state - 1);
}
