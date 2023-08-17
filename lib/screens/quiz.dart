import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/quizclass.dart';
class quiz extends StatefulWidget {
  const quiz({super.key});

  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> {

Future<bool> alertBanner(BuildContext context,dynamic level)async {
  Widget noBanner(){
    return TextButton(
      onPressed: (){
        Provider.of<QuizProvider>(context,listen: false).setSignOut(false);
        Navigator.pop(context);
      }, 
      child: Text("No"));
  }
  Widget yesBanner(){
    return TextButton(
      onPressed: () {
        Provider.of<QuizProvider>(context,listen: false).setSignOut(true);
        Provider.of<QuizProvider>(context,listen: false).deletingProgress(level);
        Navigator.pop(context);
      }, 
      child: Text("Yes"));
  }
  AlertDialog _alert = AlertDialog(
    title: Text("Quiz progress will be lost. Do you wish to proceed "),
    actions: [
      noBanner(),
      yesBanner(),
    ],
  );

  await showDialog(context: context, builder: (context) => _alert);
  var signOut = Provider.of<QuizProvider>(context,listen: false).signOut;
  return signOut;
}

var snackbarvar = const SnackBar(
  content: Text("Quiz incomplete"),
  duration: Duration(seconds: 2),
  );

  @override
  Widget build(BuildContext context) {
    var level = context.watch<QuizProvider>().level;
    var quiz1 = context.watch<QuizProvider>().quizeasy;
    var quiz2 = context.watch<QuizProvider>().quiznormal;
    var quiz3 = context.watch<QuizProvider>().quizhard;
    return WillPopScope( 
      onWillPop: ()  => alertBanner(context,level),
      child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:Color(0xFF030651 ),
        centerTitle: true,
        actions: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF030651),
              foregroundColor: Colors.white,
              elevation: 0.0
            ),
            onPressed: () {
              bool checkALLMcqsResult = level == "OOP"? context.read<QuizProvider>().checkALLMcqs(quiz1): 
                level == "DSA"?   context.read<QuizProvider>().checkALLMcqs(quiz2):
                       context.read<QuizProvider>().checkALLMcqs(quiz3);
              if(checkALLMcqsResult == true){
                Navigator.pushReplacementNamed(context, '/result');
              }
              else ScaffoldMessenger.of(context).showSnackBar(snackbarvar);
              
              
            }, icon: Icon(Icons.done),label: Text("Submit"),
            )
          ],
        title: Text(level,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.1),
        child: Container(
          decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF030651 ),Color(0xFF120084)],
                    tileMode: TileMode.clamp,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                    ),
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Container(
                    child: level == "OOP"? QuizView(quiz1: quiz1): level == "DSA"? QuizView(quiz1: quiz2) : QuizView(quiz1: quiz3),
                  ),
                    
                )
                 
        ),
      ),
    ),
    );
  }
}

class QuizView extends StatelessWidget {
  const QuizView({
    super.key,
    required this.quiz1,
  });

  final List<Quiz> quiz1;

  @override
  Widget build(BuildContext context) {
    var level = context.watch<QuizProvider>().level;
    var quiz1 = context.watch<QuizProvider>().quizeasy;
    var quiz2 = context.watch<QuizProvider>().quiznormal;
    var quiz3 = context.watch<QuizProvider>().quizhard;
    List<Quiz> quiz = level == "OOP"? quiz1: 
                      level == "DSA"? quiz2:
                      quiz3;
    return ListView.builder(
      itemCount: quiz.length,
      itemBuilder:(context, index) {
        var item = quiz[index];
        return Card(
          color: item.tapOn == true? Colors.green :Colors.blue.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 2, 5,0),
            child: Text("${index+1}. ${item.question}",style: const TextStyle(fontSize: 22),),
          ),
          IgnorePointer(
          ignoring: item.tapOn == true,
            child: ListTile(
              selectedColor: Colors.red,
              leading: Text("A." , style: TextStyle(fontSize: 19),),
              title: Text( item.optionA , style: TextStyle(fontSize: 19),),
              onTap: () {
                context.read<QuizProvider>().markedQuestion(item, item.optionA);
              },
            ),
          ),
          IgnorePointer(
          ignoring: item.tapOn == true,
            child: ListTile(
              selectedColor: Colors.red,
              leading: Text("B." , style: TextStyle(fontSize: 19),),
              title: Text( item.optionB , style: TextStyle(fontSize: 19),),
              onTap: () {
                context.read<QuizProvider>().markedQuestion(item, item.optionB);
              },
            ),
          ),
            IgnorePointer(
          ignoring: item.tapOn == true,
            child: ListTile(
              selectedColor: Colors.red,
              leading: Text("C." , style: TextStyle(fontSize: 19),),
              title: Text( item.optionC , style: TextStyle(fontSize: 19),),
              onTap: () {
                context.read<QuizProvider>().markedQuestion(item, item.optionC);
              },
            ),
            ),
          ]
        ),
        );
      },
      );
  }
}

class personalQuizView extends StatefulWidget {
  const personalQuizView({super.key});

  @override
  State<personalQuizView> createState() => _personalQuizViewState();
}

class _personalQuizViewState extends State<personalQuizView>{
 Future<bool> alertBanner(BuildContext context,List<dynamic> item)async {
  Widget noBanner(){
    return TextButton(
      onPressed: (){
        Provider.of<QuizProvider>(context,listen: false).setSignOut(false);
        Navigator.pop(context);
      }, 
      child: Text("No"));
  }
  Widget yesBanner(){
    return TextButton(
      onPressed: () {
        Provider.of<QuizProvider>(context,listen: false).setSignOut(true);
        Provider.of<QuizProvider>(context,listen: false).clearProgress(item);
        Navigator.pop(context);
      }, 
      child: Text("Yes"));
  }
  AlertDialog _alert = AlertDialog(
    title: Text("Quiz progress will be lost. Do you wish to proceed "),
    actions: [
      noBanner(),
      yesBanner(),
    ],
  );

  await showDialog(context: context, builder: (context) => _alert);
  var signOut = Provider.of<QuizProvider>(context,listen: false).signOut;
  return signOut;
}

var snackbarvar = const SnackBar(
  content: Text("Quiz incomplete"),
  duration: Duration(seconds: 2),
  );

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map;
    dynamic name = arguments["Name"];
    dynamic indexVal = arguments["index"];
    List<List> userQuizList = context.watch<QuizProvider>().quizList;
    List<dynamic> userList = userQuizList[indexVal];
    var username = userList[0];
    print(name);
    print(username.name.toString());
    return WillPopScope( 
      onWillPop: ()  => alertBanner(context,userList),
      child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:Color(0xFF030651 ),
        centerTitle: true,
        actions: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF030651),
              foregroundColor: Colors.white,
              elevation: 0.0
            ),
            onPressed: () {
              bool? checkALLMcqsResult = name == username.name ? context.read<QuizProvider>().checkPersonalMcqs(userList) : null;
              if(checkALLMcqsResult == true){
                Navigator.pushReplacementNamed(context, '/result');
              }
              else ScaffoldMessenger.of(context).showSnackBar(snackbarvar);
              
            }, icon: Icon(Icons.done),label: Text("Submit"),
            )
          ],
        title: Text(name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.1),
        child: Container(
          decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF030651 ),Color(0xFF120084)],
                    tileMode: TileMode.clamp,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                    ),
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Container(
                     child: ListView.builder(
                  itemCount: userList.length,
                  itemBuilder:(context, index) {
                    var item = userList[index];
                    return Card(
                      color: item.tapOn == true? Colors.green :Colors.blue.shade100,
                      child: Column(
                      children: [
                      Text(item.question,style: const TextStyle(fontSize: 25),),
                      IgnorePointer(
                      ignoring: item.tapOn == true,
                        child: ListTile(
                          selectedColor: Colors.red,
                          leading: Text("A" , style: TextStyle(fontSize: 19),),
                          title: Text( item.optionA , style: TextStyle(fontSize: 19),),
                          onTap: () {
                            context.read<QuizProvider>().markedPersonalQuestion(item, item.optionA);
                          },
                        ),
                      ),
                      IgnorePointer(
                      ignoring: item.tapOn == true,
                        child: ListTile(
                          selectedColor: Colors.red,
                          leading: Text("B" , style: TextStyle(fontSize: 19),),
                          title: Text( item.optionB , style: TextStyle(fontSize: 19),),
                          onTap: () {
                            context.read<QuizProvider>().markedPersonalQuestion(item, item.optionB);
                          },
                        ),
                      ),
                        IgnorePointer(
                      ignoring: item.tapOn == true,
                        child: ListTile(
                          selectedColor: Colors.red,
                          leading: Text("C" , style: TextStyle(fontSize: 19),),
                          title: Text( item.optionC , style: TextStyle(fontSize: 19),),
                          onTap: () {
                            context.read<QuizProvider>().markedPersonalQuestion(item, item.optionC);
                          },
                        ),
                        ),
                      ]
                    ),
                    );
                  },
                  ),
                  )
                )
        )
      ),
      )
    );
  }
}