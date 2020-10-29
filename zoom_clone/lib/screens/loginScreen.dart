import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_gradient/linear_gradient.dart';
import 'package:zoom_clone/helpers/helperA.dart';
import 'package:zoom_clone/main.dart';
import 'package:zoom_clone/screens/homeScreen.dart';
import 'package:zoom_clone/screens/signupScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _email =TextEditingController();
  TextEditingController _password =TextEditingController();

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }


  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradientStyle.linearGradient(
                      gradientType: LinearGradientStyle.GRADIENT_TYPE_AQUA_MARINE,
                    )
                ),
                child: Center(
                  child: Text("Zoom",style: GoogleFonts.montserrat(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white)),
                ),
              ),
              SizedBox(height: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email"
                    ),
                  ),
                  TextFormField(
                    controller: _password,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.security),
                        hintText: "Password"
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    color: Colors.blue,
                    child: MaterialButton(
                      onPressed: () async {

                        try {
                          await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text, password: _password.text);
                          Get.offAll(NavigationScreen());
                          Get.rawSnackbar(messageText: Text("Signed In!",style: GoogleFonts.poppins(color: Colors.white),),icon: Icon(Icons.info_outline,color: Colors.white,));
                        }
                        catch(e) {
                          print(e);
                          Get.rawSnackbar(messageText: Text(e.toString(),style: GoogleFonts.poppins(color: Colors.white),),icon: Icon(Icons.info_outline,color: Colors.white,));
                        }

                      },
                      child: Text("LOGIN",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
