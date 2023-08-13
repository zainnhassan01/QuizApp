import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/quizclass.dart';
import 'package:quizapp/screens/choosequiz.dart';
import 'package:quizapp/screens/home.dart';
import 'package:quizapp/screens/quiz.dart';
import 'package:quizapp/screens/result.dart';
void main() {
   runApp(
    ChangeNotifierProvider(
      create: (context) => QuizProvider(),
      child: MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/home":(context) => home(),
      "/choose":(context) => choosequiz(),
      "/quiz":(context) => quiz(),
      "/result" :(context) => result(),
      "/history":(context) => ResultHistory(),
    },
    initialRoute: "/home",
  ),
    ),
);
}