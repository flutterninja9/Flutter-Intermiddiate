import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_gradient/linear_gradient.dart';
import 'package:zoom_clone/screens/loginScreen.dart';
import 'package:zoom_clone/screens/signupScreen.dart';

class NavigateAuthScreen extends StatefulWidget {
  @override
  _NavigateAuthScreenState createState() => _NavigateAuthScreenState();
}

class _NavigateAuthScreenState extends State<NavigateAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      child: Text("LOGIN",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupScreen()));
                      },
                      child: Text("SIGNUP",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blue),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
