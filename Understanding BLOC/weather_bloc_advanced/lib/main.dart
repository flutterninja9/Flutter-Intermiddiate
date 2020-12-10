import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather_bloc_advanced/blocs/bloc/weather_bloc.dart';
import 'package:weather_bloc_advanced/controllers/bindings/navBinding.dart';
import 'package:weather_bloc_advanced/presentation/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(),
      child: GetMaterialApp(
        initialBinding: Navbinding(),
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
