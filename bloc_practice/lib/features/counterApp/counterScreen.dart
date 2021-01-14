import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'bloc/counter_bloc.dart';
import 'counterView.dart';

class CounterScreen extends StatelessWidget {
  CounterCubit counterCubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => CounterCubit(0),
        child: Center(
          child: BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return Text(state.toString());
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterCubit.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
