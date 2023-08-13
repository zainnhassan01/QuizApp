import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/quizclass.dart';

class result extends StatelessWidget {
  const result({super.key});

  @override
  Widget build(BuildContext context) {
    var result = context.watch<QuizProvider>().result;
    return Scaffold(
      backgroundColor: Color(0xFF030651),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  backgroundColor: Colors.red
                ),
                onPressed: () {
                  context.read<QuizProvider>().result = 0;
                  Navigator.pushReplacementNamed(context, '/choose');},
                 icon: const Icon(Icons.arrow_back_sharp), 
                 label: const Text("Start New Quiz",style: TextStyle(fontSize: 30),)),

                const  SizedBox(height: 20,),
                const Text(
                    "Result is",
                    style: TextStyle(fontSize: 30,color: Colors.white),
                    ),
                    const  SizedBox(height: 20,),
                    Text(
                    "$result",
                    style: TextStyle(fontSize: 80,color: Colors.white,fontWeight: FontWeight.bold),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultHistory extends StatelessWidget {
  const ResultHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}