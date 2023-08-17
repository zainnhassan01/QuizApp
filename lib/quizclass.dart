
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

class QuizProvider extends ChangeNotifier{
  SharedPreferences _prefs;

  QuizProvider(this._prefs){
    loadSaveResults();
    notifyListeners();
  }
  void loadSaveResults() async{
    // _prefs = await SharedPreferences.getInstance();
    await loadResult();
    await loadLevel();
    notifyListeners();
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

  int _result = 0 ;
  int get result => _result;
  set result(int val){
    _result = val;
  }
   Future<void> loadResult() async{ 
    try{
    String jsonString = await _prefs.getString("keyResult") ?? "[]";
    var jsonList = jsonDecode(jsonString) as List<dynamic>;
    _resultList = jsonList.toList();
    print(_resultList);
    }catch(e){
      print("Calling error $e");
    }
  }
  Future<void> loadLevel() async{ 
    try{
    String jsonLevel = await _prefs.getString("level") ?? "[]";
    var jsonLevelList  = jsonDecode(jsonLevel) as List<dynamic>;
    _levelList = jsonLevelList.toList();
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
    result = 0;
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
  void markedQuestion(Quiz item,String value){
    item.tapOn = true;
    if(value == item.correctOption){
      result = result + 1;
    }
    notifyListeners();
  }
  bool checkALLMcqs(List<Quiz> quiz){
    var name;
    for(var x in quiz){
     if(x.tapOn == false){
      return false;
    }
    }
     for(var i in quiz){
      i.tapOn = false;
      name = i.name;
    }
    _levelList.add(name);
    resultList.add(result);
    print(_levelList);
    print(_result);
    print(_resultList);
    saveResult();
    return true;
  }
  // New Quiz Methods
  List<List<dynamic>> quizList = [];

  List<dynamic> userList = [];
  void generateList({name,question,optionA,optionB,optionC,correct}){
    print("UserList $userList");
    List<dynamic> newList = List.from(userList);
    newList.add(Quiz(name: name,question: question,optionA: optionA,optionB: optionB,optionC: optionC,correctOption: correct ));
    print("newList $newList");
    userList = List.from(newList);
    notifyListeners();
  }

  void savePersonalQuiz(){
    List<dynamic> instancecopy = [...userList];
    quizList.add(instancecopy);
    print("$userList data is stored");
    print(quizList);
    notifyListeners();
  }
  void deleteQuiz(List<dynamic> value){
    quizList.remove(value);
    print(quizList);
    notifyListeners();
  }
  void clearUserList(){
    userList.clear();
    notifyListeners();
  }
 // personal quiz shit
   void markedPersonalQuestion(dynamic item,String value){
    item.tapOn = true;
    if(value == item.correctOption){
      result = result + 1;
    }
    notifyListeners();
  }
  bool checkPersonalMcqs(List<dynamic> quiz){
    var name;
    for(var x in quiz){
     if(x.tapOn == false){
      return false;
    }
    }
     for(var i in quiz){
      i.tapOn = false;
      name = i.name;
    }
    _levelList.add(name);
    resultList.add(result);
    print(_levelList);
    print(_result);
    print(_resultList);
    saveResult();
    return true;
  }
}