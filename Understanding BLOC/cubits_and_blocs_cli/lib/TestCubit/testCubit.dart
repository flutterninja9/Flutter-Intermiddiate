import 'package:bloc/bloc.dart';

class TestCubit extends Cubit {
  TestCubit(state) : super(0);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}
