import 'package:base_auth_architecture/controllers/authController.dart';
import 'package:base_auth_architecture/views/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends GetWidget<AuthController> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _email,
              decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: GoogleFonts.montserrat(),
                  prefixIcon: Icon(Icons.email)
              ),
            ),
            TextFormField(
              controller: _password,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: GoogleFonts.montserrat(),
                prefixIcon: Icon(Icons.update),
              ),
              obscureText: true,
            ),
            SizedBox(height: 15,),
            RaisedButton(
              onPressed: () {
                controller.createUser(email: _email.text,password: _password.text);
              },
              child: Text("Register",style: GoogleFonts.montserrat(),),
            ),

            FlatButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Login",style: GoogleFonts.montserrat(),),
            ),
          ],
        ),
      ),
    );
  }
}
