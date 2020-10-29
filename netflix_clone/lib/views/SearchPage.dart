import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/constants.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(color: Colors.grey[900]),
            margin: EdgeInsets.only(top: 35, left: 5, right: 5),
            width: Get.width,
            child: TextFormField(
              style: GoogleFonts.montserrat(color: Colors.white),
              cursorColor: Colors.red,
              decoration: InputDecoration(
                  focusColor: Colors.red,
                  border: InputBorder.none,
                  hintText: "Search for a show,movie,etc..",
                  hintStyle: GoogleFonts.montserrat(color: Colors.grey[400]),
                  prefixIcon: Icon(
                    FeatherIcons.search,
                    color: Colors.grey[300],
                  ),
                  suffixIcon: Icon(
                    FeatherIcons.mic,
                    color: Colors.grey[400],
                  )),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 13, left: 5, bottom: 10),
            child: Text(
              "Popular Searches",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, i) {
            return Container(
              height: 90,
              width: Get.width,
              color: Color.fromRGBO(18, 18, 18, 1),
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    child: Image.network(
                      imgList[i],
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    titleList[i],
                    style: GoogleFonts.montserrat(color: Colors.white),
                  ),
                  IconButton(
                      icon: Icon(
                        FeatherIcons.play,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                ],
              ),
            );
          }, childCount: imgList.length),
        ),
      ],
    );
  }
}
