import 'package:flutter/material.dart';

import 'home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      darkTheme: ThemeData(
          canvasColor: Color.fromRGBO(18, 18, 18, 1),
          primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
    );
  }
}
