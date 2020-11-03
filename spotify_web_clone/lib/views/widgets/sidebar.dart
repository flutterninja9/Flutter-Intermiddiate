import 'package:flutter/material.dart';
import 'package:flutter_brand_icons/flutter_brand_icons.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_gradient/linear_gradient.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:spotify_web_clone/controllers/pageController.dart';
import 'package:spotify_web_clone/controllers/playlistFetchController.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  PageControllerTest _controller = Get.put(PageControllerTest());

  PLayListController _controllerB = Get.put(PLayListController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        if (sizingInfo.isDesktop) {
          return Container(
            height: Get.height,
            margin: EdgeInsets.only(top: 20, bottom: 20, left: 10),
            width: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 25, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        BrandIcons.spotify,
                        size: 40,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Spotify",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Color.fromRGBO(18, 18, 18, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 25, bottom: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("Home");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(FeatherIcons.home),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Home",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(18, 18, 18, 1)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          print("Search");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(FeatherIcons.search),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Search",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(18, 18, 18, 1))),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          print("Library");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(FeatherIcons.disc),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Your Library",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(18, 18, 18, 1))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 18),
                  child: Text(
                    "PLAYLISTS",
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                size: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Create Playlist",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(18, 18, 18, 1))),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                gradient: LinearGradientStyle.linearGradient(
                                    gradientType: LinearGradientStyle
                                        .GRADIENT_TYPE_MOON_PURPLE)),
                            child: Center(
                              child: Icon(
                                Icons.favorite,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Liked Songs",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(18, 18, 18, 1))),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 25, top: 10, bottom: 18),
                        child: Divider(
                          color: Color.fromRGBO(18, 18, 18, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 25, bottom: 10, right: 5),
                    child: Obx(() => ListView.builder(
                        itemCount: _controllerB.playList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: InkWell(
                              onTap: () {
                                print("Hello!");
                              },
                              child: Text(
                                _controllerB.playList[index],
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[600]),
                              ),
                            ),
                          );
                        })),
                  ),
                ),
              ],
            ),
          );
        }
        else {
          return Obx(() => Container(
            height: Get.height,
            width: Get.width,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: false,
                  pinned: true,
                  backgroundColor: Color.fromRGBO(18,18,18,1,),
                  title: Icon(BrandIcons.spotify,size: 30,),
                  expandedHeight: 400,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: Stack(
                      children: [
                        Container(height: 400,width: Get.width,child: Image.network('https://c4.wallpaperflare.com/wallpaper/15/165/300/singers-taylor-swift-black-and-white-close-up-wallpaper-preview.jpg',fit: BoxFit.cover)),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,bottom: 20),
                            child: Text("Tune in to the hits of\nTaylor Swift",style: GoogleFonts.poppins(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(FeatherIcons.search,color: Colors.white,),
                      onPressed: () {},
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child:Container(
                    height: 80,
                    width: Get.width,
                    color: Color.fromRGBO(18,18,18,1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 100,
                          margin: EdgeInsets.only(top: 5,bottom: 5,right: 10),
                          child: Image.network(_controllerB.currSongPoster.value != null ? _controllerB.currSongPoster.value : 'https://images.unsplash.com/photo-1583394838336-acd977736f90?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=331&q=80',fit: BoxFit.cover,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 1),
                          child: Text(_controllerB.currSong.value,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                        _controllerB.player.playing ? IconButton(
                          icon: Icon(FeatherIcons.pause,color: Colors.white,),
                          onPressed: () {
                            _controllerB.player.pause();
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
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 15,bottom: 20),
                        child: Text("Liked by you",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                      )
                    ],
                  ),
                ),
                SliverGrid(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.8
                ),
                  delegate: SliverChildBuilderDelegate((context,index) {
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
                      onDoubleTap: () async {
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
                        width: 100,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(18,18,18,1),
                          borderRadius: BorderRadius.circular(1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                      childCount:_controllerB.categoryLiked.length ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 15,bottom: 20),
                        child: Text("Recently played",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                      )
                    ],
                  ),
                ),
                SliverGrid(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 8,
                  childAspectRatio: 0.8
                ),
                  delegate: SliverChildBuilderDelegate((context,index) {
                    return Container(
                      width: 100,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(18,18,18,1),
                        borderRadius: BorderRadius.circular(1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                      childCount:_controllerB.categoryRecent.length ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 15,bottom: 20),
                        child: Text("Based on your choices",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                      )
                    ],
                  ),
                ),
                SliverGrid(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.8
                ),
                  delegate: SliverChildBuilderDelegate((context,index) {
                    return Container(
                      width: 100,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(18,18,18,1),
                        borderRadius: BorderRadius.circular(1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                      childCount:_controllerB.categoryShortCut.length ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: Get.width,
                    height: 100,
                    child: Container(
                      color: Color.fromRGBO(18,18,18,1),
                      margin: EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Developed by : ",
                              style: GoogleFonts.poppins(color: Colors.white),
                              children:
                                [
                                  TextSpan(
                                    text: "The Flutter Ninja",
                                    style: GoogleFonts.montserrat(color: Colors.cyan)
                                  ),
                                ]
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
        }
      },
    );
  }
}

