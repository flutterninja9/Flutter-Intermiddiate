import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:whatsapp_clone/views/authViews/login.dart';

class IntroViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      onDone: () {
        Get.offAll(Login());
      },
      skip: Text("SKIP",style: GoogleFonts.inter(fontWeight: FontWeight.bold),),
      showSkipButton: true,
      done: Text("START",style: GoogleFonts.inter(fontWeight: FontWeight.bold),),
      pages: [
        PageViewModel(
          title: "Fast",
          body: "Hassle Free connections in terms of speed.",
          image: Image.network('https://cdn.dribbble.com/users/1626229/screenshots/11369653/media/cda54806c16d7f13a1e1326318558578.jpg'),
        ),
        PageViewModel(
          title: "Secure",
          body: "We keep the chats secure, So that you and your loved ones can connect securely.",
          image: Image.network('https://cdn.dribbble.com/users/121405/screenshots/5432056/folder_guy.png'),
        ),
        PageViewModel(
          title: "Clean",
          body: "Simple to use interface for everyone.",
          image: Image.network('https://cdn.dribbble.com/users/79571/screenshots/14211442/media/95be74075f9f427e6de4152318bcbe6b.png'),
        ),
      ],
    );
  }
}
