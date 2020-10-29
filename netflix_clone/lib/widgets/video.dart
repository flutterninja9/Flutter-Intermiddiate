import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VedioPlayer extends StatefulWidget {
  YoutubePlayerController controller;
  VedioPlayer({this.controller});
  @override
  _VedioPlayerState createState() => _VedioPlayerState();
}

class _VedioPlayerState extends State<VedioPlayer> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    return Scaffold(
      body: Center(
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: widget.controller,
          ),
          builder: (context,player) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                player
              ],
            );
          },
        ),
      ),
    );
  }
}
