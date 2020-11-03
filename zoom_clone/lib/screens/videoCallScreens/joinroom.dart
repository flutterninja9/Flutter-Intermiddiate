import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:zoom_clone/helpers/helperA.dart';

class JoinRoom extends StatefulWidget {
  @override
  _JoinRoomState createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  String pinCode = "";
  String userName = "";

  fetchUserData() async{
    DocumentSnapshot reference =await  userReference.doc(FirebaseAuth.instance.currentUser.uid).get();
    print(reference.data()['username']);
    setState(() {
      userName = reference.data()['username'];
    });
  }

  joinMeeting() async{
    try {
      var options = JitsiMeetingOptions()
          ..room = pinCode
          ..userDisplayName = userName
          ..audioMuted = false
          ..videoMuted = false;
      await JitsiMeet.joinMeeting(options);

    }
    catch(e) {
      Get.rawSnackbar(title: "Unable to join",messageText: Text("Some Error Occured!"));
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 10,right: 10,bottom: 20,top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter A Room Code To Join",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.bold),),
            PinCodeTextField(cursorColor: Colors.blue,appContext: context, length: 6, onChanged: (code) {
              setState(() {
                pinCode = code;
                print(pinCode);
              });
            }),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                   joinMeeting();
                  },
                  child: Text("JOIN",style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
