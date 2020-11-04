import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superchat/controllers/authController.dart';
import 'package:superchat/controllers/chatController.dart';

class Home extends GetWidget<AuthController> {
  TextEditingController _controller = TextEditingController();
  ChatController _chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 70,
            top: 20,
            child: Container(
              height: Get.height,
              width: Get.width,
              child: StreamBuilder<QuerySnapshot>(
                stream: _chatController.messageStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    Get.rawSnackbar(
                        title: "Something Went Wrong!", message: "OOPS..");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView(
                      reverse: true,
                      children:
                          snapshot.data.docs.map((DocumentSnapshot document) {
                        return Container(
                          margin: EdgeInsets.only(left: 5, bottom: 25),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(document.data()['pic']),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 5, top: 2, bottom: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[700],
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Text(
                                    document.data()['sentBy'],
                                    style: GoogleFonts.poppins(
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w500),
                                  )),
                              SizedBox(
                                width: 15,
                              ),
                              Flexible(child: Text(document.data()['message'],style: GoogleFonts.poppins(),overflow: TextOverflow.visible,)),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: SizedBox(
              width: Get.width,
              child: Container(
                width: Get.width,
                height: 50,
                margin: EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  style: GoogleFonts.poppins(),
                  controller: _controller,
                  decoration: InputDecoration(
                      hintText: "Say Something...",
                      hintStyle: GoogleFonts.poppins(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                      suffixIcon: Icon(Icons.send)),
                  onFieldSubmitted: (text) async {
                    await _chatController.sendMessages(
                        message: _controller.text);
                    _controller.text = "";
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
