import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

Widget ImageLoadingFailed() {
  return Center(
      child: Text("Failed",
          style: GoogleFonts.poppins(color: Colors.red, fontSize: 17)));
}
