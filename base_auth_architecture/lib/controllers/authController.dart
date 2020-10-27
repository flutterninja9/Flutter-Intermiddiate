import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseuser = Rx<User>();

  String get user => _firebaseuser.value?.email;

  @override
  void onInit() {
    super.onInit();
    _firebaseuser.bindStream(_auth.authStateChanges());
  }

  void createUser({String email,String password}) async{

    try {
      await  _auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    catch(e) {
        Get.rawSnackbar(title: "Unable To Create Account!",snackPosition: SnackPosition.BOTTOM,message: "Error Occured");
    }

  }

  void login({String email,String password}) async{

    try {
      await  _auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e) {
      Get.rawSnackbar(title: "Unable To Login",snackPosition: SnackPosition.BOTTOM,message: "Error Occured");
    }

  }

  void logout() async{
    try{
      await _auth.signOut();
    }
    catch(e)  {
      Get.rawSnackbar(title: "Unable To Logout",snackPosition: SnackPosition.BOTTOM,message: "Error Occured");
    }
  }
}