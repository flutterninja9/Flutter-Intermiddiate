import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  RandomColor _color = RandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            expandedHeight: 250,
            backgroundColor: Colors.purple,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Slivers"),
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
              stretchModes: [
                StretchMode.blurBackground,
                StretchMode.zoomBackground
              ],
              background: Image.network(
                'https://images.unsplash.com/photo-1500829243541-74b677fecc30?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1055&q=80',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, i) {
              return Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                color: _color.randomColor(),
                margin: EdgeInsets.only(bottom: 10),
              );
            }, childCount: 4),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate((context, i) {
                return Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: _color.randomColor(),
                );
              }, childCount: 12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10))
        ],
      ),
    );
  }
}
