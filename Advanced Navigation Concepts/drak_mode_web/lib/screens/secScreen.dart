import 'package:drak_mode_web/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sailor/sailor.dart';

class SecondScreen extends StatelessWidget {
  String data;
  SecondScreen({this.data});
  @override
  Widget build(BuildContext context) {
    String testVal = Sailor.param(context, 'data');
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.fast_forward),
            onPressed: () {
              Routes.sailor('/help');
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          testVal,
          style: GoogleFonts.montserrat(fontSize: 20),
        ),
      ),
    );
  }
}
