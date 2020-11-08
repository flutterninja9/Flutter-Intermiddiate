import 'package:cubits_and_blocs_cli/Views/CubitView.dart';
import 'package:cubits_and_blocs_cli/Views/blocView.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Management Basics With Bloc"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => CubitView()));
              },
              child: Text("Cubit"),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => BlocView()));
              },
              child: Text("Bloc"),
            ),
          ),
        ],
      ),
    );
  }
}
