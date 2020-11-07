import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_clone/constants.dart';
import 'package:whatsapp_clone/controllers/bindings/chatController.dart';

class DetailView extends GetWidget<ChatController> {
  String name;
  String image;
  String tagID;
  String uid;
  DetailView(this.name, this.image, this.tagID,this.uid);

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: mainColor,
              expandedHeight: 200,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 12),
                  child: Text(
                    "Back",
                    style: GoogleFonts.poppins(
                        color: Colors.grey[300], fontSize: 16),
                  ),
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, top: 12),
                    child: Text(
                      "Search",
                      style: GoogleFonts.poppins(
                          color: Colors.grey[300], fontSize: 16),
                    ),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: Get.width/2.3,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10),)
                        ),
                        margin: EdgeInsets.only(top: 30),
                        padding:
                            const EdgeInsets.only(left: 10, bottom: 20, top: 20,right: 8),
                        child: Text(
                          name,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10, top: 20),
                        child: Row(
                          children: [
                            Container(
                                padding: EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.4),
                                    shape: BoxShape.circle),
                                child: Icon(
                                  FeatherIcons.phone,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                padding: EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.4),
                                    shape: BoxShape.circle),
                                child: Icon(
                                  FeatherIcons.video,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: Get.height-225,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                        width: Get.width,
                        child: Container(
                          width: Get.width,
                          margin: EdgeInsets.only(left: 8,right: 8,bottom: 8),
                          height: 50,
                          decoration: BoxDecoration(
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                  ),
                                  child: TextFormField(
                                    controller: messageController,
                                    decoration: InputDecoration(
                                      hintText: "Say Anything...",
                                      suffixIcon: IconButton(
                                        color: mainColor,
                                        icon: Icon(Icons.send),
                                        onPressed: () {},
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                    onFieldSubmitted: (message) async{
                                      if(message.length != 0) {
                                        await controller.sendMessage(to: uid,message: message,personSent: messageController.text);
                                        await controller.setLastSentMessage(to: uid,message: messageController.text);
                                        messageController.text = "";
                                      }
                                      else {
                                        Get.rawSnackbar(title: "Oops!",message: "Type in something!");
                                      }
                                    } ,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: Get.height-280,
                      width: Get.width,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('whatsappChats').orderBy('created_on',descending: true).snapshots(),
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Text("Loading");
                          }
                          else {
                            return new ListView(
                              reverse: true,
                              children: snapshot.data.docs.map((DocumentSnapshot document) {
                                if(document.data()['from'] == FirebaseAuth.instance.currentUser.uid && document.data()['to'] == uid) {
                                  Timestamp obj = document.data()['created_on'];
                                  return Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text((obj.toDate().hour).toString()+":"+obj.toDate().second.toString(),style: GoogleFonts.inter(color: Colors.grey[700]),),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                                padding: EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
                                                margin: EdgeInsets.only(left: 7,bottom: 20),
                                                decoration: BoxDecoration(
                                                  color:Color.fromRGBO(237,238,247,1),
                                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                                ),
                                                child: Text(document.data()['message'],style: GoogleFonts.inter(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),)),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: CircleAvatar(
                                                backgroundColor: mainColor,
                                                radius: 18,
                                                backgroundImage: NetworkImage(FirebaseAuth.instance.currentUser.photoURL),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                else {
                                  if(document.data()['from'] == uid && document.data()['to'] == FirebaseAuth.instance.currentUser.uid) {
                                    Timestamp obj = document.data()['created_on'];
                                    return Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8),
                                                child: CircleAvatar(
                                                  backgroundColor: mainColor,
                                                  backgroundImage: NetworkImage(image),
                                                  radius: 18,
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
                                                margin: EdgeInsets.only(left: 7,bottom: 20),
                                                  decoration: BoxDecoration(
                                                    color:Color.fromRGBO(237,238,247,1),
                                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                                                  ),
                                                  child: Text(document.data()['message'],style: GoogleFonts.inter(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),)),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10),
                                            child: Text((obj.toDate().hour).toString()+":"+obj.toDate().second.toString(),style: GoogleFonts.inter(color: Colors.grey[700]),),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  else {
                                    return SizedBox();
                                  }
                                }
                              }).toList(),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
