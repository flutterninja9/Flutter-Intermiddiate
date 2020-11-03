import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_gradient/linear_gradient.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:spotify_web_clone/controllers/pageController.dart';
import 'package:spotify_web_clone/controllers/playlistFetchController.dart';

class RightBody extends StatefulWidget {
  @override
  _RightBodyState createState() => _RightBodyState();
}

class _RightBodyState extends State<RightBody> {
  PageControllerTest _controller = Get.put(PageControllerTest());
  PLayListController _controllerB = Get.put(PLayListController());
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context,sizeDetails) {
        if(sizeDetails.isDesktop) {
          return Container(
            height: Get.height,
            width: Get.width-260,
            child: Stack(
              children: [
                PageView(
                  controller: _controller.pageController,
                  children: [
                    Container(
                      height: Get.height-40,
                      width: Get.width-280,
                      margin: EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _controller.pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                                },
                                child: Container(
                                  height: 40,
                                    width: 200,
                                    margin: EdgeInsets.only(right: 20,bottom: 10,top: 1),
                                   decoration: BoxDecoration(
                                     color: Color.fromRGBO(18,18,18,1),
                                     borderRadius: BorderRadius.circular(30),
                                   ),
                                    child: Obx(() => Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: Text(_controllerB.currSong.value,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: Colors.white),),
                                        ),
                                        _controllerB.player.playing ? IconButton(
                                          icon: Icon(FeatherIcons.pause,color: Colors.white,),
                                          onPressed: () {
                                            _controllerB.player.pause();
                                            setState(() {
                                            });
                                            setState(() {

                                            });
                                          },
                                        ) : IconButton(
                                          icon: Icon(FeatherIcons.play,color: Colors.white,),
                                          onPressed: () {
                                            _controllerB.player.play();
                                            setState(() {

                                            });
                                          },
                                        ),
                                      ],
                                    ))),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 15,top: 1,bottom: 10),
                                padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(18,18,18,1),
                                  borderRadius: BorderRadius.circular(25),

                                ),
                                child: Text("UPGRADE",style: GoogleFonts.poppins(fontSize: 12,letterSpacing:3,fontWeight: FontWeight.w600,color: Colors.white),),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                margin: EdgeInsets.only(right: 15,top: 5,bottom: 15),
                                padding: EdgeInsets.only(left: 2,right: 10,top: 5,bottom: 5),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(18,18,18,1),
                                  borderRadius: BorderRadius.circular(25),

                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage('https://content.api.news/v3/images/bin/7b790c831c72c5dd3b3275833df09f29'),
                                    ),
                                    SizedBox(width: 15,),
                                    Text("Flutter Ninja",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: Get.height-110,
                            width: Get.width,
                            margin: EdgeInsets.only(left: 10,right: 10),
                            child: ListView(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                                  height: 300,
                                  width: Get.width,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Shortcuts",style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.bold),),
                                      SizedBox(height: 10,),
                                      Container(
                                        height: 230,
                                        child: Obx(() {
                                          return ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: _controllerB.categoryShortCut.length,
                                            itemBuilder: (context,index) {
                                              return Container(
                                                width: 180,
                                                margin: EdgeInsets.only(right: 20),
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(18,18,18,1,),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      width: double.infinity,
                                                      child: Center(child: Image.network(_controllerB.categoryShortCut[index].data()['posterURL'],fit: BoxFit.cover,)),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 10,top: 15),
                                                      child: Text(_controllerB.categoryShortCut[index].data()['name'],style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 10,top: 5),
                                                      child: Text(_controllerB.categoryShortCut[index].data()['detail'],overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: Colors.grey[400],fontWeight: FontWeight.w500),),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                                  height: 300,
                                  width: Get.width,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Recently played",style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.bold),),
                                      SizedBox(height: 10,),
                                      Container(
                                        height: 230,
                                        child: Obx(() {
                                          return ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: _controllerB.categoryRecent.length,
                                            itemBuilder: (context,index) {
                                              return Container(
                                                width: 180,
                                                margin: EdgeInsets.only(right: 20),
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(18,18,18,1,),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      width: double.infinity,
                                                      child: Center(child: Image.network(_controllerB.categoryRecent[index].data()['posterURL'],fit: BoxFit.cover,)),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 10,top: 15),
                                                      child: Text(_controllerB.categoryRecent[index].data()['name'],style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 10,top: 5),
                                                      child: Text(_controllerB.categoryRecent[index].data()['detail'],overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: Colors.grey[400],fontWeight: FontWeight.w500),),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                                  height: 300,
                                  width: Get.width,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Shows you might like",style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.bold),),
                                      SizedBox(height: 10,),
                                      Container(
                                        height: 230,
                                        child: Obx(() {
                                          return ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: _controllerB.categoryLiked.length,
                                            itemBuilder: (context,index) {
                                              return GestureDetector(
                                                onTap: () async{
                                                  var duration = await _controllerB.player.setUrl(_controllerB.categoryLiked[index].data()['audioURL']);
                                                  _controllerB.currSong.value = _controllerB.categoryLiked[index].data()['name'];
                                                  _controllerB.currSongPoster.value = _controllerB.categoryLiked[index].data()['posterURL'];
                                                  if(_controllerB.player.playing) {
                                                    await _controllerB.player.stop();
                                                    await _controllerB.player.setUrl(_controllerB.categoryLiked[index].data()['audioURL']);
                                                    _controllerB.player.play();
                                                  }
                                                  else {
                                                    _controllerB.player.play();
                                                  }
                                                },
                                                onDoubleTap: ()async {
                                                  if(_controllerB.player.playing) {
                                                   await  _controllerB.player.stop();
                                                   setState(() {

                                                   });
                                                  }
                                                  else {
                                                    print("Already Stopped");
                                                  }
                                                },
                                                child: Container(
                                                  width: 180,
                                                  margin: EdgeInsets.only(right: 20),
                                                  decoration: BoxDecoration(
                                                    color: Color.fromRGBO(18,18,18,1,),
                                                    borderRadius: BorderRadius.circular(6),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        height: 150,
                                                        width: double.infinity,
                                                        child: Center(child: Image.network(_controllerB.categoryLiked[index].data()['posterURL'],fit: BoxFit.cover,)),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 10,top: 15),
                                                        child: Text(_controllerB.categoryLiked[index].data()['name'],style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 10,top: 5),
                                                        child: Text(_controllerB.categoryLiked[index].data()['detail'],overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: Colors.grey[400],fontWeight: FontWeight.w500),),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    Obx(() => Container(
                      height: Get.height-40,
                      width: Get.width-280,
                      margin: EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradientStyle.linearGradient(
                              gradientType: LinearGradientStyle.GRADIENT_TYPE_GRADE_GREY,
                          )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 300,
                            width: 250,
                            margin: EdgeInsets.only(top: 40),
                            color: Colors.transparent,
                            child: Image.network(_controllerB.currSongPoster.value,fit: BoxFit.cover,),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(_controllerB.currSong.value,style: GoogleFonts.poppins(color: Colors.white,fontSize: 23,fontWeight: FontWeight.w500),),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _controllerB.player.playing ? Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white
                                  ),
                                  child: IconButton(
                                    icon: Icon(FeatherIcons.pause,color: Colors.black,),
                                    onPressed: () {
                                      _controllerB.player.pause();
                                      setState(() {
                                      });
                                      setState(() {

                                      });
                                    },
                                  ),
                                ) : Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.play_arrow,color: Colors.black,),
                                    onPressed: () {
                                      _controllerB.player.play();
                                      setState(() {

                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ],
            ),
          );
        }
        else {
          return Container();
        }
      },
    );
  }
}
