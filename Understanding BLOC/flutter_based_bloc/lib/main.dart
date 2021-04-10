import 'package:flutter/material.dart';
import 'package:flutter_based_bloc/core/oberservers.dart';
import 'package:flutter_based_bloc/features/counter/bloc/counter_bloc.dart';
import 'package:flutter_based_bloc/features/counter/counter-screen/counter-screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = SimpleObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Counter WebApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CounterScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
