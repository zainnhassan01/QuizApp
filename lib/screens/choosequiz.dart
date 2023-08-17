import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/quizclass.dart';

class choosequiz extends StatelessWidget {
  const choosequiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 250,
        child: Container(
              color: const Color(0xFF030651),
          child: Column(
            children: [
              Image(image: AssetImage('assets/images.jpeg')),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: Container(
                  child: Text("Quiz App",style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold,color: Colors.white),),
                ),
              ),
              SizedBox(
                height: 1,
                child: Container(color: Colors.black,),
                ),
              Card(
                color: Color(0xFF030651),
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "/personalList");
                  },
                  leading: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
                  title: Text("Personal Quiz",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                ),
              ),
              Card(
                color: Color(0xFF030651),
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "/history");
                  },
                  leading: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
                  title: Text("History",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:Color(0xFF030651 ),
        centerTitle: true,
        title: Text("Select Difficulty Level",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("OOP",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                  
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )
                  ),
                  onPressed: (){
                    context.read<QuizProvider>().setDifficulty("OOP");
                    context.read<QuizProvider>().setSignOut(false);
                    Navigator.pushNamed(context,"/quiz");
                  }, 
                  child: const Text("Start Quiz",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),)),
                ],
                ),
                Column(
                  children: [
                    const Text("Data Structures & Algorithms",
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5.0,
                      backgroundColor: const Color.fromARGB(255, 185, 170, 38),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )
                    ),
                  onPressed: (){
                    context.read<QuizProvider>().setDifficulty("DSA");
                    context.read<QuizProvider>().setSignOut(false);
                     Navigator.pushNamed(context,"/quiz");
                  }, 
                  child: const Text("Start Quiz",
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)),
                ],
                ),
                Column(
                  children: [
                         Padding(
                           padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                           child: const  Text("Database & Management Systems",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                         ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                          backgroundColor: Colors.red.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )
                        ),
                        onPressed: (){
                          context.read<QuizProvider>().setDifficulty("DBMS");
                          context.read<QuizProvider>().setSignOut(false);
                           Navigator.pushNamed(context,"/quiz");
                        }, 
                        child: const Text("Start Quiz",
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)),
                      ],
                      ),
                 Column(
                  children: [
                          Text("Compose Personal Quiz?",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                        ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                          backgroundColor: Colors.blue.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )
                        ),
                        onPressed: (){
                          Navigator.pushNamed(context, "/newquiz");
                        }, 
                        child: const Text("Let's Go!",
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)),
                      ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PersonalQuizList extends StatefulWidget {
  const PersonalQuizList({super.key});

  @override
  State<PersonalQuizList> createState() => _PersonalQuizListState();
}

class _PersonalQuizListState extends State<PersonalQuizList> {


  @override
  Widget build(BuildContext context) {
    var list = context.watch<QuizProvider>().quizList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF030651),
        title: Text("Choose a Quiz",style: TextStyle(fontSize: 25),),
      ),
      body: list.isEmpty? 
      const Center(
        child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text("No Personal Quiz Found.",style: TextStyle(fontSize: 20),),
      )) :
      ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
        List<dynamic> value = list[index];
        if(value.isNotEmpty){
        var data = value[0];
          return Card(
            color: const Color.fromARGB(255, 5, 8, 96),
            child: ListTile(
              onTap: (){
                Map<dynamic, dynamic> arguments = {
                  "Name": data.name,
                  "index": index,
                };
              Navigator.pushReplacementNamed(context, "/personalQuizView",arguments: arguments);
              },
              leading: const Icon(Icons.school,size: 25,color: Colors.white,),
              title: Text(
                data.name,
                style: const TextStyle(fontSize: 23,color: Colors.white),
                ),
              trailing: IconButton(
                onPressed: () {
                  context.read<QuizProvider>().deleteQuiz(value);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  ),
                ),
            ),
          );
        } 
        },
      
      
      ),
    );
  }
}

/*
    Map<dynamic, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map;
    dynamic name = arguments["Name"];
    dynamic index = arguments["index"];
    List<List> userQuizList = context.watch<QuizProvider>().quizList;
    List<dynamic> userList = userQuizList[index];
    var username = userList[0];
    print(name);
    print(username.name.toString());
    name == username.name ? context.read<QuizProvider>().checkALLMcqs(userList):
*/