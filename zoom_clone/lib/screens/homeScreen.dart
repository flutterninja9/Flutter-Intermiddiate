import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_clone/screens/profileScreen.dart';
import 'package:zoom_clone/screens/videocallScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currIndex = 0;

  List screens = [
    VideoCallScrenn(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: Text("Zoom",style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),),
     // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currIndex,
        selectedItemColor: Color.fromRGBO(39, 118, 171,1),
        unselectedItemColor: Color.fromRGBO(18,18,18,1),
        onTap: (index) {
          setState(() {
            currIndex=index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
            label: "Settings"
          )
        ],
      ),
      body: screens[currIndex],
    );
  }
}
