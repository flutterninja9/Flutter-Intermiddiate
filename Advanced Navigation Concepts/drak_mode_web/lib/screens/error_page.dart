import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Error 404",
          style: GoogleFonts.poppins(fontSize: 35),
        ),
      ),
    );
  }
}
