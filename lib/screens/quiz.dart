import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/quizclass.dart';
class quiz extends StatefulWidget {
  const quiz({super.key});

  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> {

Future<bool> alertBanner(BuildContext context)async {
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
      onWillPop: () => alertBanner(context),
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
              bool checkALLMcqsResult = context.read<QuizProvider>().checkALLMcqs();
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
                    child: level == "Easy"? QuizView(quiz1: quiz1): level == "Normal"? QuizView(quiz1: quiz2) : QuizView(quiz1: quiz3),
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
    return ListView.builder(
      itemCount: quiz1.length,
      itemBuilder:(context, index) {
        var item = quiz1[index];
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
                context.read<QuizProvider>().markedQuestion(item, item.optionA);
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
                context.read<QuizProvider>().markedQuestion(item, item.optionB);
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
