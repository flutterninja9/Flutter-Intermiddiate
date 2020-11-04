import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superchat/controllers/authController.dart';

class Login extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login",style: GoogleFonts.poppins(),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign In With",style: GoogleFonts.poppins(fontSize: 20),),
              SizedBox(width: 10,),
              GestureDetector(
                onTap: () async{
                  await controller.login();
                },
                child: Text("G",style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
