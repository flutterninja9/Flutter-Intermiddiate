import 'dart:convert';

import 'package:http/http.dart';
import 'package:quizly/models/quizModel.dart';

getData() async{
  String url="https://opentdb.com/api.php?amount=50&type=boolean";
  Response response = await get(url);
  Map<String,dynamic> quizResults = jsonDecode(response.body);
  QuizModel quizModel = QuizModel.fromJson(quizResults);
  return quizModel;
}