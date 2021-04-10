import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:streams_in_dart/counter-screen.dart';
import 'package:streams_in_dart/observer.dart';

// Quite simple example od Pure Dart based bloc

void main() {
  Bloc.observer = SimpleObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Counterscreen(),
    );
  }
}
