import 'package:base_auth_architecture/controllers/bindings/authbindings.dart';
import 'package:base_auth_architecture/views/login.dart';
import 'package:base_auth_architecture/views/root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    initialBinding: AuthBinding(),
    home: Root(),debugShowCheckedModeBanner: false,));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),() {
      Get.offAll(Login());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Todo App",style: GoogleFonts.poppins(fontSize: 35,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
