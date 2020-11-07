import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_clone/constants.dart';
import 'package:whatsapp_clone/controllers/bindings/authController.dart';
import 'package:whatsapp_clone/controllers/bindings/chatController.dart';
import 'package:whatsapp_clone/main.dart';
import 'package:whatsapp_clone/views/detailView.dart';

class HomeScreen extends GetWidget<AuthController> {
  ChatController _chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: mainColor,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, bottom: 0, top: 25, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Chat with\nyour friends",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.signOut();
                              },
                              child: Text(
                                "Logout",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width,
                        height: 100,
                        padding: EdgeInsets.only(left: 20),
                        child: Center(
                          child: StreamBuilder<QuerySnapshot>(
                              stream: _chatController.users,
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Text('Something went wrong');
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Text("Loading");
                                }

                                return new ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: snapshot.data.docs
                                      .map((DocumentSnapshot document) {
                                    return FirebaseAuth
                                                .instance.currentUser.email !=
                                            document.data()['email']
                                        ? Container(
                                            padding: EdgeInsets.only(right: 15),
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.to(
                                                    DetailView(
                                                        document.data()['name'],
                                                        document.data()['pic'],
                                                        document.data()['pic'],
                                                        document.data()['uid']),
                                                    transition:
                                                        Transition.cupertino);
                                              },
                                              child: new CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 28,
                                                backgroundImage: NetworkImage(
                                                    document.data()['pic']),
                                              ),
                                            ),
                                          )
                                        : Container();
                                  }).toList(),
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: _chatController.users,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return SliverToBoxAdapter(
                        key: UniqueKey(), child: Text('Something went wrong'));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SliverToBoxAdapter(
                        key: UniqueKey(), child: Text("Loading"));
                  } else {
                    return SliverToBoxAdapter(
                        child: Container(
                            height: Get.height,
                            width: Get.width,
                            color: Colors.white,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              primary: false,
                              children: snapshot.data.docs
                                  .map((DocumentSnapshot document) {
                                return FirebaseAuth
                                            .instance.currentUser.email !=
                                        document.data()['email']
                                    ? Container(
                                        padding: EdgeInsets.only(right: 15),
                                        child: GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                  DetailView(
                                                      document.data()['name'],
                                                      document.data()['pic'],
                                                      document.data()['pic'],
                                                      document.data()['uid']),
                                                  transition:
                                                      Transition.cupertino);
                                            },
                                            child: ListTile(
                                                leading: new CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 28,
                                                  backgroundImage: NetworkImage(
                                                      document.data()['pic']),
                                                ),
                                                title: Text(
                                                  document.data()['name'],
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                subtitle: Text(
                                                  "Hey, What's the matter?",
                                                  style: GoogleFonts.inter(),
                                                ),
                                                trailing: Text(
                                                  "12:25",
                                                  style: GoogleFonts.inter(
                                                      color: Colors.grey[700]),
                                                ))),
                                      )
                                    : Container();
                              }).toList(),
                            )));
                  }
                })
          ],
        ));
  }
}
