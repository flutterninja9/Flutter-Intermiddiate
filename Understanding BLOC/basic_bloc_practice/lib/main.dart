import 'package:basic_bloc_practice/bloc/bloc/loader_bloc.dart';
import 'package:basic_bloc_practice/presentation/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoaderBloc>(
      create: (context) => LoaderBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
