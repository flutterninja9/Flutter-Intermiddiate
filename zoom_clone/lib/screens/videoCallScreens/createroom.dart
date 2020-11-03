import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class CreateRoom extends StatefulWidget {
  @override
  _CreateRoomState createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {

  String code = "";

  getCode() {
    var uuid = Uuid();
    String test = uuid.v1();
    print(code);
    setState(() {
      code=test.substring(0,6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 5,),
          Card(
            color: Colors.cyan,
            child: Container(
              width: Get.width,
              padding: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
              child: Column(
                children: [
                  Text("Your Room Code",style: GoogleFonts.poppins(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                  Text(code,style: GoogleFonts.poppins(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          RaisedButton(
            onPressed: () {
              getCode();
            },
            child: Text("GET CODE",style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
          ),
        ],
      )
    );
  }
}
