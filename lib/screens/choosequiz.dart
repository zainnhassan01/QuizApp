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
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, "/history");
                },
                leading: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
                title: Text("History",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
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
                    Text("Easy",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                  
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )
                  ),
                  onPressed: (){
                    context.read<QuizProvider>().setDifficulty("Easy");
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
                    const Text("Normal",
                    style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5.0,
                      backgroundColor: const Color.fromARGB(255, 185, 170, 38),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )
                    ),
                  onPressed: (){
                    context.read<QuizProvider>().setDifficulty("Normal");
                    context.read<QuizProvider>().setSignOut(false);
                     Navigator.pushNamed(context,"/quiz");
                  }, 
                  child: const Text("Start Quiz",
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)),
                ],
                ),
                Column(
                  children: [
                         const  Text("Hard",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                          backgroundColor: Colors.red.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )
                        ),
                        onPressed: (){
                          context.read<QuizProvider>().setDifficulty("Hard");
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