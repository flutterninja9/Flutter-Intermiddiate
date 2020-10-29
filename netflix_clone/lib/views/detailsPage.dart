import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/widgets/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailsPage extends StatefulWidget {
  DocumentSnapshot snapshot;
  DetailsPage({this.snapshot});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          expandedHeight: 600,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.snapshot['posterURL']),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black87, BlendMode.darken)
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      height: 250,
                      width: 200,
                      child: Image.network(widget.snapshot['posterURL']),
                    ),
                  ),
                  SizedBox(height: 13,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("97% Match",style: GoogleFonts.montserrat(color: Colors.green,fontSize: 15),),
                      SizedBox(width: 15,),
                      Text("2005",style: GoogleFonts.montserrat(color: Colors.grey[300],fontSize: 15),),
                      SizedBox(width: 15,),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text("16+",style: GoogleFonts.montserrat(color: Colors.black87,fontSize: 15),),
                      ),
                      SizedBox(width: 15,),
                      Text("3 Seasons",style: GoogleFonts.montserrat(color: Colors.grey[300],fontSize: 15),),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10,left: 5,right: 5),
                    color: Colors.grey[200],
                    child: MaterialButton(
                      onPressed: () {
                        YoutubePlayerController _controller = YoutubePlayerController(
                          initialVideoId: widget.snapshot['vidID'],
                          flags: YoutubePlayerFlags(
                            autoPlay: true,
                            mute: false,
                          ),
                        );
                        Get.to(VedioPlayer(controller: _controller,));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.play_arrow,color: Colors.black87,size: 30,),
                          SizedBox(width: 5,),
                          Text("Play",style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 16),),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10,left: 5,right: 5),
                    color: Colors.grey[200].withOpacity(0.2),
                    child: Center(
                      child: MaterialButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.download_done_outlined,color: Colors.white,),
                            SizedBox(width: 5,),
                            Text("Download  S1:E2",style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8,top: 20),
                    child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer mollis posuere consectetur. Proin finibus justo eget felis suscipit hendrerit. Suspendisse lobortis et sapien eu tincidunt.",style: GoogleFonts.montserrat(fontSize: 16,color: Colors.grey[300]),),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 15,),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add,color: Colors.white,),
                            ),
                            Text("My List",style: GoogleFonts.montserrat(color: Colors.white),),
                          ],
                        ),
                        SizedBox(width: 15,),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(FeatherIcons.thumbsUp,color: Colors.white,),
                            ),
                            Text("Like",style: GoogleFonts.montserrat(color: Colors.white),),
                          ],
                        ),
                        SizedBox(width: 15,),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(FeatherIcons.share,color: Colors.white,),
                            ),
                            Text("Share",style: GoogleFonts.montserrat(color: Colors.white),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
