import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/quizclass.dart';

class result extends StatelessWidget {
  const result({super.key});

  @override
  Widget build(BuildContext context) {
    var level = context.watch<QuizProvider>().level;
    var result = context.watch<QuizProvider>().result;
    print("Result $result");
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
                  context.read<QuizProvider>().deletingProgress(level);
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
    var level = context.watch<QuizProvider>().levelList;
    var result = context.watch<QuizProvider>().resultList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF030651),
        title: Text("Result",style: TextStyle(fontSize: 25),),
      ),
      body: result.isEmpty? 
       const Center(
        child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text("Attempted Quiz result is displayed here.",style: TextStyle(fontSize: 20),),
      )) :
      ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          int val = result[index];
          String l = level[index];
          return Card(
            color: const Color.fromARGB(255, 5, 8, 96),
            child: ListTile(
              leading: const CircleAvatar(
                child: Image(
                  image:  AssetImage(
                  'assets/images (1).png'
                  )
                ),
              ),
              title: Text(
                val.toString()+ " Marks",
                style: TextStyle(fontSize: 20,color: Colors.white),
                ),
              subtitle: Text("Quiz: $l",style: TextStyle(fontSize: 20,color: Colors.white),),
              trailing: IconButton(
                onPressed: () {
                  context.read<QuizProvider>().deleteResult(index);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  ),
                ),
            ),
          );
        },
      
      ),
    );
  }
}