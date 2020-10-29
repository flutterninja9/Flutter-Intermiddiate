import 'package:flutter/material.dart';
import 'package:flutter_brand_icons/flutter_brand_icons.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_gradient/linear_gradient.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:spotify_web_clone/controllers/playlistFetchController.dart';

class SideBar extends GetWidget<PLayListController> {
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
                        itemCount: controller.playList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: InkWell(
                              onTap: () {
                                print("Hello!");
                              },
                              child: Text(
                                controller.playList[index],
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
          return Container(
            height: Get.height,
            width: Get.width,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  backgroundColor: Colors.white,
                  title: Text("Spotify.",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: Color.fromRGBO(18,18,18,1)),),
                  leading: IconButton(
                    icon: Icon(FeatherIcons.menu,color: Color.fromRGBO(18,18,18,1),),
                    onPressed: () {},
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(FeatherIcons.search,color: Color.fromRGBO(18,18,18,1),),
                      onPressed: () {},
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 400,
                    width: Get.width,
                    color: Colors.lime,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 400,
                    width: Get.width,
                    color: Colors.cyan,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 400,
                    width: Get.width,
                    color: Colors.pink,
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}

