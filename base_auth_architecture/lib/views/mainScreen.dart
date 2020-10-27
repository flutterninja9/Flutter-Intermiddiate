import 'package:base_auth_architecture/controllers/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",style: GoogleFonts.montserrat(),),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            controller.logout();
          },
          child: Text("Logout"),
          color: Colors.red,
        ),
      ),
    );
  }
}
