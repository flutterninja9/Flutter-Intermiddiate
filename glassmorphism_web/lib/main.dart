import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GlassHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GlassHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images.wallpapersden.com/image/download/orange-blue-gradient-mix_a2hqbWqUmZqaraWkpJRrZWVlrWhlZWU.jpg'),
                      fit: BoxFit.cover)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                child: Container(
                    margin: EdgeInsets.only(
                        top: 100, bottom: 100, left: 100, right: 100),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey[300].withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      "Hello World!",
                      style: TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
