import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_gradient/linear_gradient.dart';
import 'package:zoom_clone/helpers/helperA.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String userName;

  fetchUserData() async{
    DocumentSnapshot reference =await  userReference.doc(FirebaseAuth.instance.currentUser.uid).get();
    print(reference.data()['username']);
    setState(() {
      userName = reference.data()['username'];
    });
  }

  updateUserData({username}) async{
    await  userReference.doc(FirebaseAuth.instance.currentUser.uid).update({
      'username' : username
    });
    setState(() {
      userName = username;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height/2.5,
              decoration: BoxDecoration(
                gradient: LinearGradientStyle.linearGradient(
                  gradientType: LinearGradientStyle.GRADIENT_TYPE_AQUA_MARINE
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: Get.height/3.1,left: Get.width/2.7),
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue,
              backgroundImage: NetworkImage('https://workhound.com/wp-content/uploads/2017/05/placeholder-profile-pic.png'),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  userName==null?CircularProgressIndicator():Text(userName,style: GoogleFonts.montserrat(fontSize: 30,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradientStyle.linearGradient(
                        gradientType: LinearGradientStyle.GRADIENT_TYPE_AMETHYST
                      )
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        print("Hello");
                        Get.defaultDialog(title: "Change Username",content: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Username",
                                prefixIcon: Icon(Icons.person)
                              ),
                              onFieldSubmitted: (text) async{
                                await updateUserData(username: text);
                                Get.back();
                                Get.rawSnackbar(messageText: Text("Profile Updated!",style: GoogleFonts.poppins(color: Colors.white),),icon: Icon(Icons.info_outline,color: Colors.white,));
                              },
                            ),
                          ],
                        ));
                      },
                      child: Text("Edit Profile",style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradientStyle.linearGradient(
                            gradientType: LinearGradientStyle.GRADIENT_TYPE_BURNING_ORANGE
                        )
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        print("Hello");
                        FirebaseAuth.instance.signOut();
                      },
                      child: Text("LOGOUT",style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
