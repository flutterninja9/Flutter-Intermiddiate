import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:zoom_clone/authentication/authscreennavigator.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showSkipButton: true,
      skip: Text("SKIP",style: TextStyle(fontSize: 18),),
      next: Icon(Icons.arrow_forward_ios,),
      onDone: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NavigateAuthScreen()));
      },
      done: Text("START",style: TextStyle(fontSize: 18),),
      pages: [
        PageViewModel(
          title: "Welcome",
          body: "Welcome To Zoom, The High-End Video Conference App",
          image: Container(
            child: Image.asset('assets/welcome.webp'),
          )
        ),
        PageViewModel(
            title: "Secure",
            body: "Keeps your meetings encrypted,\n So no worries",
            image: Container(
              child: Image.asset('assets/secure.webp'),
            )
        ),
        PageViewModel(
            title: "Let's Go!",
            body: "Meet the world of new opportunities",
            image: Container(
              child: Image.asset('assets/connect.webp'),
            )
        ),
      ],
    );
  }
}
