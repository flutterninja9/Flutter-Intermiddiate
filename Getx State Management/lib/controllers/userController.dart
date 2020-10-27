import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:understanding_getx_sm/models/userModel.dart';

class UserController extends GetxController {
  var users = List<UserModel>().obs;


  getUsers() async{
    Response response = await get('https://jsonplaceholder.typicode.com/users');
    List<UserModel> testList = [];
    List data = jsonDecode(response.body);
    for(int i=0;i<data.length;i++) {
      users.add(UserModel.fromJson(data[i]));
    }
   // users.value = testList;
  }

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }

  modifyUser() {
    users.removeAt(0);
    update();
  }


}