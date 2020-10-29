import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizly/controllers/quizController.dart';

class Home extends GetWidget<QuizController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Boolean King",style: GoogleFonts.poppins(),),
      ),
      body: controller.model==null?Center(child: CircularProgressIndicator(),): ListView.builder(
        itemCount: controller.counter()==0? 0:controller.model.value.results.length,
        itemBuilder: (context,i) {
          return Card(
            child: Column(
              children: [
                Text(controller.model.value.results[i].question)
              ],
            ),
          );
        },
      )
    );
  }
}
