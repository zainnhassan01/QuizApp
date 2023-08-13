import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
class Quiz{
  String question;
  String optionA;
  String optionB;
  String optionC;
  String correctOption;
  bool tapOn = false;
  Quiz(
    {required this.question,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.correctOption});
}

List<Quiz> baseQues = List.generate(5, (index) {
 return Quiz(question: "Easy Question $index", optionA: "Easy Option A", optionB: "Easy Option B", optionC: "Easy Option C", correctOption: "Easy Option A");
});

List<Quiz> NormalQues = List.generate(5, (index) {
 return Quiz(question: "Normal Question $index", optionA: "Normal Option A", optionB: "Normal Option B", optionC: "Normal Option C", correctOption: "Normal Option A");
});

List<Quiz> HardQues = List.generate(5, (index) {
 return Quiz(question: "Hard Question $index", optionA: "Hard Option A", optionB: "Hard Option B", optionC: "Hard Option C", correctOption: "Hard Option A");
});

List<int> resultValue = [];
class QuizProvider extends ChangeNotifier{
  var prefs;
  QuizProvider(){
    loadSaveResults();
  }
  void loadSaveResults() async{
    prefs = SharedPreferences.getInstance;
    await loadResult();
  }
  final List<Quiz> _quiz = baseQues;
  List<Quiz> get quizeasy => _quiz;

  final List<Quiz> _normalquiz = NormalQues;
  List<Quiz> get quiznormal => _normalquiz;

  final List<Quiz> _hardquiz = HardQues;
  List<Quiz> get quizhard => _hardquiz;

  Future<void> loadResult() async{
  }
  void saveResult () async {
    try{
    var jsonList = jsonEncode(resultValue);
    await prefs.setString("keyResult" , jsonList);
    }catch(e){
      print(e);
    }
  }
  //Pop Out Banner Value
  bool _signOut = false;
  bool get signOut => _signOut;
  void setSignOut(bool val){
    _signOut = val;
    notifyListeners();
  }
  int result = 0;
  
//for selecting difficulty level
  String _level = "" ;
  String get level => _level;
  void setDifficulty(String value){
    _level = value;
    notifyListeners();
  }
// MCQS selection Mechanism
  void markedQuestion(Quiz item,String value){
    item.tapOn = true;
    if(value == item.correctOption){
      result++;
    }
    notifyListeners();
  }
  bool checkALLMcqs(){
    for(var x in quizeasy){
     if(x.tapOn == false){
      return false;
    }
    }
     for(var i in quizeasy){
      i.tapOn = false;
    }
    resultValue.add(result);
    print(result);
    print(resultValue);
    saveResult();
    return true;
  }
  

}