import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
class Quiz{
  String question;
  String name;
  String optionA;
  String optionB;
  String optionC;
  String correctOption;
  bool tapOn = false;
  Quiz(
    {required this.name,
   required this.question,
   required this.optionA,
   required this.optionB,
   required this.optionC,
   required this.correctOption});
}

List<Quiz> baseQues = List.generate(5, (index) {
 return Quiz(name: "Easy",question: "Easy Question $index", optionA: "Easy Option A", optionB: "Easy Option B", optionC: "Easy Option C", correctOption: "Easy Option A");
});

List<Quiz> NormalQues = List.generate(5, (index) {
 return Quiz(name: "Normal",question: "Normal Question $index", optionA: "Normal Option A", optionB: "Normal Option B", optionC: "Normal Option C", correctOption: "Normal Option A");
});

List<Quiz> HardQues = List.generate(5, (index) {
 return Quiz(name: "Hard",question: "Hard Question $index", optionA: "Hard Option A", optionB: "Hard Option B", optionC: "Hard Option C", correctOption: "Hard Option A");
});

List<Quiz> newList = [];
class QuizProvider extends ChangeNotifier{
  var _prefs;
  var _result;
  int get resultR => _result;
  set result(int val){
    result = val;
    notifyListeners();
  }
  QuizProvider(){
    loadSaveResults();
  }
  void loadSaveResults() async{
    _prefs = await SharedPreferences.getInstance();
    await loadResult();
  }
  final List<Quiz> _quiz = baseQues;
  List<Quiz> get quizeasy => _quiz;

  final List<Quiz> _normalquiz = NormalQues;
  List<Quiz> get quiznormal => _normalquiz;

  final List<Quiz> _hardquiz = HardQues;
  List<Quiz> get quizhard => _hardquiz;

  List<dynamic> _resultList = [];
  List<dynamic> get resultList => _resultList;

  List<dynamic> _levelList = [];
  List<dynamic> get levelList => _levelList;
  Future<void> loadResult() async{ 
    try{
    String jsonLevel = await _prefs.getString("level") ?? "[]";
    var jsonLevelList  = jsonDecode(jsonLevel) as List<dynamic>;
    _levelList = jsonLevelList.toList();
    String jsonString = await _prefs.getString("keyValue") ?? "[]";
    var jsonList = jsonDecode(jsonString) as List<dynamic>;
    _resultList = jsonList.toList();
    print(_resultList);
    }catch(e){
      print("Calling error $e");
    }
  }
  void deleteResult(int index){
    _resultList.removeAt(index);
    print(_resultList);
    saveResult();
    notifyListeners();
  }
  void saveResult () async {
    try{
    var jsonLevelList = jsonEncode(_levelList);
    await _prefs.setString("level" , jsonLevelList);
    var jsonList = jsonEncode(_resultList);
    await _prefs.setString("keyResult" , jsonList);
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
  void clearProgress(List<dynamic> item){
    for(var i in item){
      i.tapOn = false;
    }
    _result = 0;
    notifyListeners();
  }
  void deletingProgress(dynamic level) {
    level == "Easy"? clearProgress(quizeasy) : 
       level == "Normal"?   clearProgress(quiznormal):
        clearProgress(quizhard);
  }
  
  
  
//for selecting difficulty level
  String _level = "" ;
  String get level => _level;
  void setDifficulty(String value){
    _level = value;
    notifyListeners();
  }
// MCQS selection Mechanism
  void markedQuestion(dynamic item,String value){
    item.tapOn = true;
    if(value == item.correctOption){
      _result++;
    }
    notifyListeners();
  }
  bool checkALLMcqs(List<dynamic> quiz){
    for(var x in quiz){
     if(x.tapOn == false){
      return false;
    }
    }
     for(var i in quizeasy){
      i.tapOn = false;
    }
    _levelList.add(_level);
    _resultList.add(_result);
    print(_levelList);
    print(_result);
    print(_resultList);
    saveResult();
    return true;
  }
  // New Quiz Methods
  List<List> quizList = [];

  List<Quiz> userList = [];
  void generateList({name,question,optionA,optionB,optionC,correct}){
    List<Quiz> newList = userList;
    newList.add(Quiz(name: name,question: question,optionA: optionA,optionB: optionB,optionC: optionC,correctOption: correct ));
    print("user list $newList");
    userList = newList;
    notifyListeners();
  }

  void savePersonalQuiz(){
    quizList.add(userList);
    print(quizList);
    notifyListeners();
  }
  void deleteQuiz(List<dynamic> value){
    quizList.remove(value);
    print(quizList);
    notifyListeners();
  }
  
  

}