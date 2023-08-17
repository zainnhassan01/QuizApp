import 'package:flutter/material.dart';
import 'package:quizapp/quizclass.dart';
import 'package:provider/provider.dart';
class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {

  TextEditingController _controllername = TextEditingController();
  GlobalKey<FormState> _globalKey = GlobalKey();

  void _validateName(BuildContext context){
    if(_globalKey.currentState!.validate()){
      var name = _controllername.text;
      Navigator.pushNamed(context, "/addquestion",arguments: name);                    
    }
  }
  String? validate(String? val){
    return val!.isEmpty? "Invalid Name" : null;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/backgroundImage.jpeg'),
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0,30,10,10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const Text("Enter Quiz Name",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: _globalKey,
                      child: TextFormField(
                        controller: _controllername,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                          hintText: "Enter the name of quiz",
                          label: Text("Name",style: TextStyle(fontSize: 20),)
                        ),
                        validator:(value) => validate(value),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  ElevatedButton.icon(
                    onPressed: () => _validateName(context), 
                    icon: Icon(Icons.arrow_right), 
                    label: Text("Generate Quiz..."))
          
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class addquestion extends StatefulWidget {
  const addquestion({super.key});
  @override
  State<addquestion> createState() => _addquestionState();
}

class _addquestionState extends State<addquestion> {
  GlobalKey<FormState> _globalKey = GlobalKey();
  TextEditingController _controllerquestion = TextEditingController();
  TextEditingController _OptionA = TextEditingController();
  TextEditingController _OptionB = TextEditingController();
  TextEditingController _OptionC = TextEditingController();
  TextEditingController _correctOption = TextEditingController();

void addQuestion(BuildContext context,String name){

  if(_globalKey.currentState!.validate()){
    var question = _controllerquestion.text;
    var A = _OptionA.text;
    var B = _OptionB.text;
    var C = _OptionC.text;
    var correct = _correctOption.text;
    _controllerquestion.clear();
    _OptionA.clear();
    _OptionB.clear();
    _OptionC.clear();
    _correctOption.clear();
    Provider.of<QuizProvider>(context,listen: false).generateList(name: name,question: question,optionA: A,optionB: B,optionC: C,correct: correct);
  }
}

  String? _validatequestion(String? value){
    return value!.isEmpty? "Invalid Question" : null;
  }
  String? _validateoptionA(String? value){
    return value!.isEmpty? "Invalid Option" : null;
  }
  String? _validateoptionB(String? value){
    return value!.isEmpty? "Invalid Option" : null;
  }
  String? _validateoptionC(String? value){
    return value!.isEmpty? "Invalid Option" : null;
  }
  String? _validateCorrectOption(String? value){
    return value!.isEmpty? "Invalid Option" : null;
  }

  @override
  Widget build(BuildContext context) {
    String name = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: _globalKey,
              child: Column(
                children: [
                  const Padding(
                    padding: const EdgeInsets.fromLTRB(8.0,20,8,10),
                    child: Text("Enter First Question",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            validator: (value) => _validatequestion(value),
                            controller: _controllerquestion,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                              hintText: "Enter the question",
                              label: Text("Question",style: TextStyle(fontSize: 20),)
                            ),
                          ),
                        ),
                        const  Padding(
                          padding: const EdgeInsets.fromLTRB(8.0,20,8,10),
                          child: Text("Enter Option A",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            validator: (value) => _validateoptionA(value),
                            controller: _OptionA,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                              hintText: "Enter Option A",
                              label: Text("Option A",style: TextStyle(fontSize: 20),)
                            ),
                          ),
                        ),
                        const  Padding(
                          padding: const EdgeInsets.fromLTRB(8.0,20,8,10),
                          child: Text("Enter Option B",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            validator: (value) => _validateoptionB(value),
                            controller: _OptionB,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                              hintText: "Enter Option B",
                              label: Text("Option B",style: TextStyle(fontSize: 20),)
                            ),
                          ),
                        ),
                        const  Padding(
                          padding: const EdgeInsets.fromLTRB(8.0,20,8,10),
                          child: Text("Enter Option C",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            validator: (value) => _validateoptionC(value),
                            controller: _OptionC,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                              hintText: "Enter Option C",
                              label: Text("Option C",style: TextStyle(fontSize: 20),)
                            ),
                          ),
                        ),
                        const  Padding(
                          padding: const EdgeInsets.fromLTRB(8.0,20,8,10),
                          child: Text("Enter Correct Option",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            validator: (value) => _validateCorrectOption(value),
                            controller: _correctOption,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                              hintText: "Enter Correct Option. Also Check Spelling...",
                              label: Text("Correct Option",style: TextStyle(fontSize: 20),)
                            ),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                                )
                              ),
                              onPressed: () {
                                context.read<QuizProvider>().savePersonalQuiz();
                                // context.read<QuizProvider>().clearUserList();
                                Navigator.pushNamed(context, "/choose");                    
                                }, 
                              icon: Icon(Icons.arrow_back), 
                              label: Text("Home Screen")
                              ),
                            ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                            )
                          ),
                          onPressed: () => addQuestion(context,name), 
                          icon: Icon(Icons.add), 
                          label: Text("Add Question")
                          ),
                          ],
                        ),
                          
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}