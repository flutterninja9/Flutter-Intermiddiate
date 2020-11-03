import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_web_clone/controllers/playlistFetchController.dart';
import 'package:spotify_web_clone/views/widgets/rightBody.dart';
import 'package:spotify_web_clone/views/widgets/sidebar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(child: Row(
            children: [
              SideBar(),
              RightBody(),
            ],
          )),
        ],
      ),
    );
  }
}
