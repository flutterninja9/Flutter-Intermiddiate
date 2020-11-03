import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_clone/screens/videoCallScreens/createroom.dart';
import 'package:zoom_clone/screens/videoCallScreens/joinroom.dart';

class VideoCallScrenn extends StatefulWidget {
  @override
  _VideoCallScrennState createState() => _VideoCallScrennState();
}

class _VideoCallScrennState extends State<VideoCallScrenn> with SingleTickerProviderStateMixin {

  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =  TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zoom",style: GoogleFonts.poppins(fontWeight: FontWeight.w500),),
        centerTitle: true,
        bottom: TabBar(
          physics: BouncingScrollPhysics(),
          controller: _controller,
          tabs: [
            Tab(
              icon: Icon(Icons.video_call),
              text: "Join Room",
            ),
            Tab(
              icon: Icon(Icons.meeting_room),
              text: "Create Room",
            ),
          ],
        ),
      ),
      body:TabBarView(
        controller: _controller,
        children: [
          JoinRoom(),
          CreateRoom(),
        ],
      ),
    );
  }
}
