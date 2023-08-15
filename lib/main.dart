import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/quizclass.dart';
import 'package:quizapp/screens/choosequiz.dart';
import 'package:quizapp/screens/home.dart';
import 'package:quizapp/screens/personalquiz.dart';
import 'package:quizapp/screens/quiz.dart';
import 'package:quizapp/screens/result.dart';
void main() {
   runApp(
    ChangeNotifierProvider(
      create: (context) => QuizProvider(),
      child: MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/home":(context) => const home(),
      "/choose":(context) => const choosequiz(),
      "/quiz":(context) => const quiz(),
      "/result" :(context) => const result(),
      "/history":(context) => const ResultHistory(),
      "/newquiz":(context) => const Personal(),
      "/addquestion":(context) => const addquestion(),
      "/personalList" :(context) => const PersonalQuizList(),
      "/personalQuizView":(context) => const personalQuizView()
    },
    initialRoute: "/home",
  ),
    ),
);
}