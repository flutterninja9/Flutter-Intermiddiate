import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:weather_bloc_advanced/presentation/widgets/home_desktop.dart';
import 'package:weather_bloc_advanced/presentation/widgets/home_mobile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, constraints) {
          if (constraints.deviceScreenType == DeviceScreenType.desktop) {
            return HomeDesktop();
          } else {
            return HomeMobile();
          }
        },
      ),
    );
  }
}
