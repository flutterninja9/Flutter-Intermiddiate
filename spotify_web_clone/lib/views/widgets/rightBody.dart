import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_gradient/linear_gradient.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:spotify_web_clone/controllers/pageController.dart';

class RightBody extends StatefulWidget {
  @override
  _RightBodyState createState() => _RightBodyState();
}

class _RightBodyState extends State<RightBody> {
  PageControllerTest _controller = Get.put(PageControllerTest());
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
                              Container(
                                margin: EdgeInsets.only(right: 15,top: 5),
                                padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(18,18,18,1),
                                  borderRadius: BorderRadius.circular(25),

                                ),
                                child: Text("UPGRADE",style: GoogleFonts.poppins(fontSize: 12,letterSpacing:3,fontWeight: FontWeight.w600,color: Colors.white),),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                margin: EdgeInsets.only(right: 15,top: 5),
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
                          Expanded(
                            child: ListView(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 15,top: 10,bottom: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Shortcuts",style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.bold),),
                                          SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
                                                margin: EdgeInsets.only(right: 15),
                                                width: 180,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(18,18,18,1,),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      child: Image.network('https://miro.medium.com/max/593/1*9hY2ojYUjLzz0u_tC6YuhQ.jpeg',fit: BoxFit.cover,),
                                                    ),
                                                    Text("Kohinoor",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                                    Text("Tune in to Divine's Latest Album Kohinoor",overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: Colors.grey[400],fontWeight: FontWeight.w500),),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
                                                margin: EdgeInsets.only(right: 15),
                                                width: 180,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(18,18,18,1,),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      child: Image.network('https://miro.medium.com/max/593/1*9hY2ojYUjLzz0u_tC6YuhQ.jpeg',fit: BoxFit.cover,),
                                                    ),
                                                    Text("Kohinoor",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                                    Text("Tune in to Divine's Latest Album Kohinoor",overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: Colors.grey[400],fontWeight: FontWeight.w500),),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
                                                margin: EdgeInsets.only(right: 15),
                                                width: 180,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(18,18,18,1,),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      child: Image.network('https://miro.medium.com/max/593/1*9hY2ojYUjLzz0u_tC6YuhQ.jpeg',fit: BoxFit.cover,),
                                                    ),
                                                    Text("Kohinoor",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                                    Text("Tune in to Divine's Latest Album Kohinoor",overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: Colors.grey[400],fontWeight: FontWeight.w500),),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
                                                margin: EdgeInsets.only(right: 15),
                                                width: 180,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(18,18,18,1,),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      child: Image.network('https://miro.medium.com/max/593/1*9hY2ojYUjLzz0u_tC6YuhQ.jpeg',fit: BoxFit.cover,),
                                                    ),
                                                    Text("Kohinoor",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                                    Text("Tune in to Divine's Latest Album Kohinoor",overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: Colors.grey[400],fontWeight: FontWeight.w500),),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
                                                margin: EdgeInsets.only(right: 15),
                                                width: 180,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(18,18,18,1,),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      child: Image.network('https://miro.medium.com/max/593/1*9hY2ojYUjLzz0u_tC6YuhQ.jpeg',fit: BoxFit.cover,),
                                                    ),
                                                    Text("Kohinoor",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                                    Text("Tune in to Divine's Latest Album Kohinoor",overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: Colors.grey[400],fontWeight: FontWeight.w500),),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 15,top: 10,bottom: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Based on your interest",style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.bold),),
                                          SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
                                                margin: EdgeInsets.only(right: 15),
                                                width: 180,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(18,18,18,1,),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      child: Image.network('https://miro.medium.com/max/593/1*9hY2ojYUjLzz0u_tC6YuhQ.jpeg',fit: BoxFit.cover,),
                                                    ),
                                                    Text("Kohinoor",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                                    Text("Tune in to Divine's Latest Album Kohinoor",overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: Colors.grey[400],fontWeight: FontWeight.w500),),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
                                                margin: EdgeInsets.only(right: 15),
                                                width: 180,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(18,18,18,1,),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      child: Image.network('https://miro.medium.com/max/593/1*9hY2ojYUjLzz0u_tC6YuhQ.jpeg',fit: BoxFit.cover,),
                                                    ),
                                                    Text("Kohinoor",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                                    Text("Tune in to Divine's Latest Album Kohinoor",overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: Colors.grey[400],fontWeight: FontWeight.w500),),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
                                                margin: EdgeInsets.only(right: 15),
                                                width: 180,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(18,18,18,1,),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      child: Image.network('https://miro.medium.com/max/593/1*9hY2ojYUjLzz0u_tC6YuhQ.jpeg',fit: BoxFit.cover,),
                                                    ),
                                                    Text("Kohinoor",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                                    Text("Tune in to Divine's Latest Album Kohinoor",overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: Colors.grey[400],fontWeight: FontWeight.w500),),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
                                                margin: EdgeInsets.only(right: 15),
                                                width: 180,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(18,18,18,1,),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      child: Image.network('https://miro.medium.com/max/593/1*9hY2ojYUjLzz0u_tC6YuhQ.jpeg',fit: BoxFit.cover,),
                                                    ),
                                                    Text("Kohinoor",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                                    Text("Tune in to Divine's Latest Album Kohinoor",overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: Colors.grey[400],fontWeight: FontWeight.w500),),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
                                                margin: EdgeInsets.only(right: 15),
                                                width: 180,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(18,18,18,1,),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      child: Image.network('https://miro.medium.com/max/593/1*9hY2ojYUjLzz0u_tC6YuhQ.jpeg',fit: BoxFit.cover,),
                                                    ),
                                                    Text("Kohinoor",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                                    Text("Tune in to Divine's Latest Album Kohinoor",overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: Colors.grey[400],fontWeight: FontWeight.w500),),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 15,top: 10,bottom: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Recently played",style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.bold),),
                                          SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
                                                margin: EdgeInsets.only(right: 15),
                                                width: 180,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(18,18,18,1,),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      child: Image.network('https://miro.medium.com/max/593/1*9hY2ojYUjLzz0u_tC6YuhQ.jpeg',fit: BoxFit.cover,),
                                                    ),
                                                    Text("Kohinoor",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                                    Text("Tune in to Divine's Latest Album Kohinoor",overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: Colors.grey[400],fontWeight: FontWeight.w500),),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
                                                margin: EdgeInsets.only(right: 15),
                                                width: 180,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(18,18,18,1,),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      child: Image.network('https://miro.medium.com/max/593/1*9hY2ojYUjLzz0u_tC6YuhQ.jpeg',fit: BoxFit.cover,),
                                                    ),
                                                    Text("Kohinoor",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                                    Text("Tune in to Divine's Latest Album Kohinoor",overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: Colors.grey[400],fontWeight: FontWeight.w500),),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
                                                margin: EdgeInsets.only(right: 15),
                                                width: 180,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(18,18,18,1,),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      child: Image.network('https://miro.medium.com/max/593/1*9hY2ojYUjLzz0u_tC6YuhQ.jpeg',fit: BoxFit.cover,),
                                                    ),
                                                    Text("Kohinoor",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                                    Text("Tune in to Divine's Latest Album Kohinoor",overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: Colors.grey[400],fontWeight: FontWeight.w500),),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
                                                margin: EdgeInsets.only(right: 15),
                                                width: 180,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(18,18,18,1,),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      child: Image.network('https://miro.medium.com/max/593/1*9hY2ojYUjLzz0u_tC6YuhQ.jpeg',fit: BoxFit.cover,),
                                                    ),
                                                    Text("Kohinoor",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                                    Text("Tune in to Divine's Latest Album Kohinoor",overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: Colors.grey[400],fontWeight: FontWeight.w500),),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
                                                margin: EdgeInsets.only(right: 15),
                                                width: 180,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(18,18,18,1,),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      child: Image.network('https://miro.medium.com/max/593/1*9hY2ojYUjLzz0u_tC6YuhQ.jpeg',fit: BoxFit.cover,),
                                                    ),
                                                    Text("Kohinoor",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                                    Text("Tune in to Divine's Latest Album Kohinoor",overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: Colors.grey[400],fontWeight: FontWeight.w500),),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: Get.height-40,
                      width: Get.width-280,
                      margin: EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradientStyle.linearGradient(
                              gradientType: LinearGradientStyle.GRADIENT_TYPE_GREEN_BEACH
                          )
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(18,18,18,1),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                            onPressed: () {
                              _controller.pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                            },
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(18,18,18,1),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                          onPressed: () {
                            _controller.pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                          },
                        ),
                      ),
                    ],
                  ),
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
