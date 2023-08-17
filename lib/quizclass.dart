
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

    Map<String, dynamic> toJson() {
    return {
      'question': question,
      'optionA': optionA,
      'optionB': optionB,
      'optionC': optionC,
      'correctOption' : correctOption,
      'tapOn' : tapOn,
      'name':name,
    };
    }
}

List<Quiz> baseQues = [
    Quiz(
    name: "OOP",
    question: "What does OOP stand for?",
    optionA: "Object Oriented Programming",
    optionB: "Overly Optimized Performance",
    optionC: "Only Obfuscated Patterns",
    correctOption: "Object Oriented Programming",
  ),
  Quiz(
    name: "OOP",
    question: "Which concept focuses on bundling data and methods that operate on the data?",
    optionA: "Inheritance",
    optionB: "Polymorphism",
    optionC: "Encapsulation",
    correctOption: "Encapsulation",
  ),
  Quiz(
    name: "OOP",
    question: "Which OOP concept allows a class to inherit properties and behaviors from another class?",
    optionA: "Polymorphism",
    optionB: "Abstraction",
    optionC: "Inheritance",
    correctOption: "Inheritance",
  ),
  Quiz(
    name: "OOP",
    question: "In OOP, what is a blueprint for creating objects known as?",
    optionA: "Function",
    optionB: "Class",
    optionC: "Method",
    correctOption: "Class",
  ),
  Quiz(
    name: "OOP",
    question: "Which OOP principle allows a single method to have different implementations based on the context?",
    optionA: "Polymorphism",
    optionB: "Encapsulation",
    optionC: "Abstraction",
    correctOption: "Polymorphism",
  ),
  Quiz(
    name: "OOP",
    question: "What does the 'this' keyword refer to in an instance method?",
    optionA: "The current class",
    optionB: "The superclass",
    optionC: "A local variable",
    correctOption: "The current class",
  ),
  Quiz(
    name: "OOP",
    question: "Which OOP principle involves hiding the internal details of an object and showing only the necessary functionalities?",
    optionA: "Abstraction",
    optionB: "Polymorphism",
    optionC: "Inheritance",
    correctOption: "Abstraction",
  ),
  Quiz(
    name: "OOP",
    question: "What is a constructor in OOP used for?",
    optionA: "To destroy an object",
    optionB: "To create an object",
    optionC: "To define a class",
    correctOption: "To create an object",
  ),
  Quiz(
    name: "OOP",
    question: "In OOP, which concept allows a class to have multiple methods with the same name but different parameters?",
    optionA: "Overloading",
    optionB: "Overriding",
    optionC: "Inheritance",
    correctOption: "Overloading",
  ),
  Quiz(
    name: "OOP",
    question: "What is the purpose of the 'super' keyword in OOP?",
    optionA: "To access static methods",
    optionB: "To refer to the current instance",
    optionC: "To call a method from the superclass",
    correctOption: "To call a method from the superclass",
  ),
  Quiz(
    name: "OOP",
    question: "Which OOP principle allows a class to provide a general behavior that can be overridden in its subclasses?",
    optionA: "Polymorphism",
    optionB: "Inheritance",
    optionC: "Abstraction",
    correctOption: "Abstraction",
  ),
  Quiz(
    name: "OOP",
    question: "What is the main benefit of using OOP?",
    optionA: "Higher performance",
    optionB: "Code reuse and organization",
    optionC: "Simpler syntax",
    correctOption: "Code reuse and organization",
  ),
  Quiz(
    name: "OOP",
    question: "Which OOP concept allows a class to implement multiple interfaces?",
    optionA: "Polymorphism",
    optionB: "Abstraction",
    optionC: "Multiple Inheritance",
    correctOption: "Multiple Inheritance",
  ),
  Quiz(
    name: "OOP",
    question: "In OOP, what is an abstract class?",
    optionA: "A class that cannot be instantiated",
    optionB: "A class without any methods",
    optionC: "A class with only private members",
    correctOption: "A class that cannot be instantiated",
  ),
  Quiz(
    name: "OOP",
    question: "Which keyword is used to define a new class that inherits properties and behaviors from an existing class?",
    optionA: "this",
    optionB: "super",
    optionC: "extends",
    correctOption: "extends",
  ),
  Quiz(
    name: "OOP",
    question: "In OOP, which keyword is used to allow a subclass to provide a specific implementation of a method that is already defined in its superclass?",
    optionA: "override",
    optionB: "implement",
    optionC: "extend",
    correctOption: "override",
  ),
  Quiz(
    name: "OOP",
    question: "What is encapsulation in OOP?",
    optionA: "Hiding internal details and exposing functionality",
    optionB: "Creating multiple instances of a class",
    optionC: "Defining new data types",
    correctOption: "Hiding internal details and exposing functionality",
  ),
  Quiz(
    name: "OOP",
    question: "Which OOP principle allows a class to have methods with the same name but different implementations?",
    optionA: "Abstraction",
    optionB: "Polymorphism",
    optionC: "Encapsulation",
    correctOption: "Polymorphism",
  ),
  Quiz(
    name: "OOP",
    question: "What is a static method in OOP?",
    optionA: "A method that can only be accessed from outside the class",
    optionB: "A method that belongs to the class rather than an instance",
    optionC: "A method that can only be called by the superclass",
    correctOption: "A method that belongs to the class rather than an instance",
  ),
  Quiz(
    name: "OOP",
    question: "Which OOP concept allows a class to provide a general behavior that must be implemented by its subclasses?",
    optionA: "Polymorphism",
    optionB: "Abstraction",
    optionC: "Inheritance",
    correctOption: "Abstraction",
  ),
  Quiz(
    name: "OOP",
    question: "What is a destructor in OOP used for?",
    optionA: "To create an object",
    optionB: "To finalize an object",
    optionC: "To release resources when an object is no longer needed",
    correctOption: "To release resources when an object is no longer needed",
  ),
  Quiz(
    name: "OOP",
    question: "In OOP, what is a class variable?",
    optionA: "A variable that belongs to an instance of the class",
    optionB: "A variable that belongs to the superclass",
    optionC: "A variable that belongs to the class itself",
    correctOption: "A variable that belongs to the class itself",
  ),
  Quiz(
    name: "OOP",
    question: "Which OOP principle involves defining a clear and concise interface for interacting with an object?",
    optionA: "Abstraction",
    optionB: "Encapsulation",
    optionC: "Polymorphism",
    correctOption: "Abstraction",
  ),
  Quiz(
    name: "OOP",
    question: "In OOP, what is a method?",
    optionA: "A function that is defined within a class",
    optionB: "A variable that stores data",
    optionC: "A type of loop",
    correctOption: "A function that is defined within a class",
  ),
  Quiz(
    name: "OOP",
    question: "Which OOP principle allows a class to provide a specific implementation for a method that is already defined in its superclass?",
    optionA: "Inheritance",
    optionB: "Polymorphism",
    optionC: "Encapsulation",
    correctOption: "Inheritance",
  ),
  Quiz(
    name: "OOP",
    question: "What is a private member in OOP?",
    optionA: "A member that can be accessed from any class",
    optionB: "A member that can only be accessed from within the same class",
    optionC: "A member that is inherited from a superclass",
    correctOption: "A member that can only be accessed from within the same class",
  ),
  Quiz(
    name: "OOP",
    question: "Which OOP principle allows a class to have multiple methods with the same name but different parameters and return types?",
    optionA: "Overloading",
    optionB: "Polymorphism",
    optionC: "Encapsulation",
    correctOption: "Overloading",
  ),
  Quiz(
    name: "OOP",
    question: "What is inheritance in OOP?",
    optionA: "A process of bundling data and methods",
    optionB: "A process of creating multiple instances of a class",
    optionC: "A process of inheriting properties and behaviors from a superclass",
    correctOption: "A process of inheriting properties and behaviors from a superclass",
  ),
  Quiz(
    name: "OOP",
    question: "In OOP, what is an instance variable?",
    optionA: "A variable that belongs to the superclass",
    optionB: "A variable that is defined within a method",
    optionC: "A variable that belongs to an instance of the class",
    correctOption: "A variable that belongs to an instance of the class",
  ),
  Quiz(
    name: "OOP",
    question: "Which OOP concept allows a class to have multiple methods with the same name but different implementations?",
    optionA: "Encapsulation",
    optionB: "Polymorphism",
    optionC: "Abstraction",
    correctOption: "Polymorphism",
  ),
  Quiz(
    name: "OOP",
    question: "What is method overriding in OOP?",
    optionA: "Defining a new method in a subclass",
    optionB: "Providing a specific implementation for a method that is already defined in the superclass",
    optionC: "Hiding internal details of a method",
    correctOption: "Providing a specific implementation for a method that is already defined in the superclass",
  ),
  Quiz(
    name: "OOP",
    question: "Which OOP principle allows a class to provide a general behavior that must be implemented by its subclasses?",
    optionA: "Inheritance",
    optionB: "Polymorphism",
    optionC: "Abstraction",
    correctOption: "Abstraction",
  ),
  Quiz(
    name: "OOP",
    question: "What is a virtual method in OOP?",
    optionA: "A method that can be accessed from any class",
    optionB: "A method that can only be accessed from within the same class",
    optionC: "A method that is defined in a superclass and can be overridden in subclasses",
    correctOption: "A method that is defined in a superclass and can be overridden in subclasses",
  ),
  Quiz(
    name: "OOP",
    question: "In OOP, what is a base class?",
    optionA: "A class that inherits from another class",
    optionB: "A class that is inherited from",
    optionC: "A class that cannot be instantiated",
    correctOption: "A class that is inherited from",
  ),
  Quiz(
    name: "OOP",
    question: "Which OOP concept allows a class to provide different implementations for a method in its subclasses?",
    optionA: "Encapsulation",
    optionB: "Polymorphism",
    optionC: "Inheritance",
    correctOption: "Polymorphism",
  ),
  Quiz(
    name: "OOP",
    question: "What is dynamic binding in OOP?",
    optionA: "The process of binding variables to methods at compile time",
    optionB: "The process of binding variables to methods at runtime",
    optionC: "The process of binding variables to attributes",
    correctOption: "The process of binding variables to methods at runtime",
  ),
  Quiz(
    name: "OOP",
    question: "In OOP, what is a subclass?",
    optionA: "A class that inherits properties and behaviors from another class",
    optionB: "A class that provides a general behavior",
    optionC: "A class that cannot be instantiated",
    correctOption: "A class that inherits properties and behaviors from another class",
  ),
  Quiz(
    name: "OOP",
    question: "Which OOP principle allows a class to hide the internal details of an object and expose only the necessary functionalities?",
    optionA: "Abstraction",
    optionB: "Polymorphism",
    optionC: "Encapsulation",
    correctOption: "Encapsulation",
  ),
  Quiz(
    name: "OOP",
    question: "What is a constructor in OOP?",
    optionA: "A method used to destroy an object",
    optionB: "A method used to create an object",
    optionC: "A method used to define a class",
    correctOption: "A method used to create an object",
  ),
  Quiz(
    name: "OOP",
    question: "In OOP, what is an interface?",
    optionA: "A class that cannot be instantiated",
    optionB: "A blueprint for creating objects",
    optionC: "A contract that defines methods a class must implement",
    correctOption: "A contract that defines methods a class must implement",
  ),
  Quiz(
    name: "OOP",
    question: "Which OOP principle allows a class to have multiple methods with the same name but different implementations?",
    optionA: "Polymorphism",
    optionB: "Encapsulation",
    optionC: "Inheritance",
    correctOption: "Polymorphism",
  ),
  Quiz(
    name: "OOP",
    question: "What is a final class in OOP?",
    optionA: "A class that cannot be instantiated",
    optionB: "A class that can only be accessed from within the same package",
    optionC: "A class that cannot be inherited from",
    correctOption: "A class that cannot be inherited from",
  ),
  Quiz(
    name: "OOP",
    question: "Which OOP principle involves defining a clear and concise interface for interacting with an object?",
    optionA: "Abstraction",
    optionB: "Polymorphism",
    optionC: "Encapsulation",
    correctOption: "Abstraction",
  ),
  Quiz(
    name: "OOP",
    question: "In OOP, what is a static variable?",
    optionA: "A variable that belongs to an instance of the class",
    optionB: "A variable that belongs to the class itself",
    optionC: "A variable that belongs to the superclass",
    correctOption: "A variable that belongs to the class itself",
  ),
  Quiz(
    name: "OOP",
    question: "Which OOP principle allows a class to provide a general behavior that can be overridden in its subclasses?",
    optionA: "Polymorphism",
    optionB: "Abstraction",
    optionC: "Inheritance",
    correctOption: "Abstraction",
  ),
  Quiz(
    name: "OOP",
    question: "What is a static method in OOP?",
    optionA: "A method that belongs to the class itself",
    optionB: "A method that can only be accessed from within the same class",
    optionC: "A method that can be accessed from any class",
    correctOption: "A method that belongs to the class itself",
  ),
  Quiz(
    name: "OOP",
    question: "In OOP, which concept allows a class to provide a general behavior that must be implemented by its subclasses?",
    optionA: "Polymorphism",
    optionB: "Inheritance",
    optionC: "Abstraction",
    correctOption: "Abstraction",
  ),
  Quiz(
    name: "OOP",
    question: "What is the main benefit of using OOP?",
    optionA: "Higher performance",
    optionB: "Code reuse and organization",
    optionC: "Simpler syntax",
    correctOption: "Code reuse and organization",
  ),
  Quiz(
    name: "OOP",
    question: "Which OOP concept allows a class to implement multiple interfaces?",
    optionA: "Polymorphism",
    optionB: "Abstraction",
    optionC: "Multiple Inheritance",
    correctOption: "Multiple Inheritance",
  ),
  Quiz(
    name: "OOP",
    question: "In OOP, what is an abstract class?",
    optionA: "A class that cannot be instantiated",
    optionB: "A class without any methods",
    optionC: "A class with only private members",
    correctOption: "A class that cannot be instantiated",
  ),
  Quiz(
    name: "OOP",
    question: "Which keyword is used to define a new class that inherits properties and behaviors from an existing class?",
    optionA: "this",
    optionB: "super",
    optionC: "extends",
    correctOption: "extends",
  ),
  Quiz(
    name: "OOP",
    question: "In OOP, which keyword is used to allow a subclass to provide a specific implementation of a method that is already defined in its superclass?",
    optionA: "override",
    optionB: "implement",
    optionC: "extend",
    correctOption: "override",
  ),
  Quiz(
    name: "OOP",
    question: "What is encapsulation in OOP?",
    optionA: "Hiding internal details and exposing functionality",
    optionB: "Creating multiple instances of a class",
    optionC: "Defining new data types",
    correctOption: "Hiding internal details and exposing functionality",
  ),
  Quiz(
    name: "OOP",
    question: "Which OOP principle allows a class to have methods with the same name but different implementations?",
    optionA: "Abstraction",
    optionB: "Polymorphism",
    optionC: "Encapsulation",
    correctOption: "Polymorphism",
  ),
];


List<Quiz> NormalQues = [
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the time complexity of inserting an element into a stack?",
    optionA: "O(1)",
    optionB: "O(log n)",
    optionC: "O(n)",
    correctOption: "O(1)",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which data structure uses the First-In-First-Out (FIFO) principle?",
    optionA: "Stack",
    optionB: "Queue",
    optionC: "Heap",
    correctOption: "Queue",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which sorting algorithm has the worst-case time complexity of O(n^2)?",
    optionA: "Merge Sort",
    optionB: "Quick Sort",
    optionC: "Bubble Sort",
    correctOption: "Bubble Sort",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the purpose of a hash table?",
    optionA: "Storing data in a sorted order",
    optionB: "Storing data in a heap",
    optionC: "Storing and retrieving data with constant time complexity",
    correctOption: "Storing and retrieving data with constant time complexity",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which data structure is used to implement depth-first search (DFS) in a graph?",
    optionA: "Queue",
    optionB: "Stack",
    optionC: "Heap",
    correctOption: "Stack",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "In a binary search tree, which node is smaller than its parent and all its descendants?",
    optionA: "Left Child",
    optionB: "Right Child",
    optionC: "Root Node",
    correctOption: "Left Child",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which data structure is used to implement breadth-first search (BFS) in a graph?",
    optionA: "Stack",
    optionB: "Queue",
    optionC: "LinkedList",
    correctOption: "Queue",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the time complexity of searching for an element in a balanced binary search tree?",
    optionA: "O(1)",
    optionB: "O(log n)",
    optionC: "O(n)",
    correctOption: "O(log n)",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which algorithm is used to find the shortest path in a weighted graph?",
    optionA: "Depth-First Search (DFS)",
    optionB: "Breadth-First Search (BFS)",
    optionC: "Dijkstra's Algorithm",
    correctOption: "Dijkstra's Algorithm",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which data structure is used to implement a priority queue?",
    optionA: "Queue",
    optionB: "Stack",
    optionC: "Heap",
    correctOption: "Heap",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the time complexity of a linear search algorithm?",
    optionA: "O(1)",
    optionB: "O(log n)",
    optionC: "O(n)",
    correctOption: "O(n)",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which sorting algorithm has the best average-case time complexity?",
    optionA: "Insertion Sort",
    optionB: "Selection Sort",
    optionC: "Merge Sort",
    correctOption: "Merge Sort",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the primary advantage of using a linked list over an array?",
    optionA: "Constant-time access to elements",
    optionB: "Dynamic size and efficient insertion/deletion",
    optionC: "Cache-friendly memory layout",
    correctOption: "Dynamic size and efficient insertion/deletion",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which data structure is used to implement a LIFO (Last-In-First-Out) behavior?",
    optionA: "Queue",
    optionB: "Stack",
    optionC: "Heap",
    correctOption: "Stack",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the time complexity of the binary search algorithm?",
    optionA: "O(1)",
    optionB: "O(log n)",
    optionC: "O(n)",
    correctOption: "O(log n)",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which algorithm is used to find the minimum spanning tree in a graph?",
    optionA: "Prim's Algorithm",
    optionB: "Kruskal's Algorithm",
    optionC: "Dijkstra's Algorithm",
    correctOption: "Prim's Algorithm",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the main purpose of a hash function in hash tables?",
    optionA: "To ensure elements are in sorted order",
    optionB: "To convert strings to integers",
    optionC: "To map keys to indices in an array",
    correctOption: "To map keys to indices in an array",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which data structure is used to implement a First-In-First-Out (FIFO) behavior?",
    optionA: "Stack",
    optionB: "Queue",
    optionC: "Heap",
    correctOption: "Queue",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the time complexity of inserting an element into a binary heap?",
    optionA: "O(1)",
    optionB: "O(log n)",
    optionC: "O(n)",
    correctOption: "O(log n)",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which sorting algorithm works by repeatedly swapping adjacent elements if they are in the wrong order?",
    optionA: "Bubble Sort",
    optionB: "Insertion Sort",
    optionC: "Selection Sort",
    correctOption: "Bubble Sort",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the primary advantage of using a binary search tree?",
    optionA: "Constant-time insertion and deletion",
    optionB: "Fast search and retrieval",
    optionC: "Dynamic size and efficient memory usage",
    correctOption: "Fast search and retrieval",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which algorithm is used to find the shortest path in an unweighted graph?",
    optionA: "Dijkstra's Algorithm",
    optionB: "Bellman-Ford Algorithm",
    optionC: "Breadth-First Search (BFS)",
    correctOption: "Breadth-First Search (BFS)",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the time complexity of removing an element from a queue?",
    optionA: "O(1)",
    optionB: "O(log n)",
    optionC: "O(n)",
    correctOption: "O(1)",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which data structure is used to implement a Last-In-First-Out (LIFO) behavior?",
    optionA: "Queue",
    optionB: "Stack",
    optionC: "LinkedList",
    correctOption: "Stack",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the time complexity of searching for an element in a hash table?",
    optionA: "O(1)",
    optionB: "O(log n)",
    optionC: "O(n)",
    correctOption: "O(1)",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which algorithm is used to find the shortest path in a graph with negative edge weights?",
    optionA: "Dijkstra's Algorithm",
    optionB: "Bellman-Ford Algorithm",
    optionC: "Kruskal's Algorithm",
    correctOption: "Bellman-Ford Algorithm",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the main advantage of using a priority queue over a regular queue?",
    optionA: "Faster insertion",
    optionB: "Constant-time access to elements",
    optionC: "Guaranteed order of elements",
    correctOption: "Guaranteed order of elements",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which data structure is used to implement a stack?",
    optionA: "Queue",
    optionB: "Stack",
    optionC: "Heap",
    correctOption: "Stack",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the time complexity of merging two sorted arrays into a single sorted array?",
    optionA: "O(1)",
    optionB: "O(log n)",
    optionC: "O(n)",
    correctOption: "O(n)",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which algorithm is used to find the maximum flow in a flow network?",
    optionA: "Bellman-Ford Algorithm",
    optionB: "Dijkstra's Algorithm",
    optionC: "Ford-Fulkerson Algorithm",
    correctOption: "Ford-Fulkerson Algorithm",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the primary advantage of using a linked list over an array?",
    optionA: "Constant-time access to elements",
    optionB: "Dynamic size and efficient insertion/deletion",
    optionC: "Cache-friendly memory layout",
    correctOption: "Dynamic size and efficient insertion/deletion",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which data structure uses the Last-In-First-Out (LIFO) principle?",
    optionA: "Queue",
    optionB: "Stack",
    optionC: "Heap",
    correctOption: "Stack",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the time complexity of searching for an element in a binary search tree?",
    optionA: "O(1)",
    optionB: "O(log n)",
    optionC: "O(n)",
    correctOption: "O(log n)",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which algorithm is used to find the connected components in an undirected graph?",
    optionA: "Depth-First Search (DFS)",
    optionB: "Breadth-First Search (BFS)",
    optionC: "Dijkstra's Algorithm",
    correctOption: "Depth-First Search (DFS)",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the primary advantage of using a heap over a binary search tree?",
    optionA: "Fast search and retrieval",
    optionB: "Constant-time insertion and deletion",
    optionC: "Efficient memory usage",
    correctOption: "Efficient memory usage",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which data structure is used to implement a LIFO (Last-In-First-Out) behavior?",
    optionA: "Queue",
    optionB: "Stack",
    optionC: "Heap",
    correctOption: "Stack",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the time complexity of inserting an element into a binary search tree?",
    optionA: "O(1)",
    optionB: "O(log n)",
    optionC: "O(n)",
    correctOption: "O(log n)",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which algorithm is used to find the longest common subsequence of two strings?",
    optionA: "Dijkstra's Algorithm",
    optionB: "Bellman-Ford Algorithm",
    optionC: "Dynamic Programming",
    correctOption: "Dynamic Programming",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the primary purpose of a binary search tree?",
    optionA: "Fast search and retrieval",
    optionB: "Constant-time insertion and deletion",
    optionC: "Efficient memory usage",
    correctOption: "Fast search and retrieval",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which algorithm is used to find the longest path in a directed acyclic graph?",
    optionA: "Depth-First Search (DFS)",
    optionB: "Bellman-Ford Algorithm",
    optionC: "Topological Sort",
    correctOption: "Topological Sort",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the primary advantage of using a hash table for storing data?",
    optionA: "Constant-time insertion and deletion",
    optionB: "Fast search and retrieval",
    optionC: "Guaranteed order of elements",
    correctOption: "Constant-time insertion and deletion",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which data structure is used to implement a First-In-First-Out (FIFO) behavior?",
    optionA: "Stack",
    optionB: "Queue",
    optionC: "Heap",
    correctOption: "Queue",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the time complexity of removing an element from a stack?",
    optionA: "O(1)",
    optionB: "O(log n)",
    optionC: "O(n)",
    correctOption: "O(1)",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which algorithm is used to find the shortest path in a graph?",
    optionA: "Prim's Algorithm",
    optionB: "Kruskal's Algorithm",
    optionC: "Dijkstra's Algorithm",
    correctOption: "Dijkstra's Algorithm",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the primary advantage of using a linked list over an array?",
    optionA: "Constant-time access to elements",
    optionB: "Dynamic size and efficient insertion/deletion",
    optionC: "Cache-friendly memory layout",
    correctOption: "Dynamic size and efficient insertion/deletion",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which data structure uses the First-In-First-Out (FIFO) principle?",
    optionA: "Stack",
    optionB: "Queue",
    optionC: "Heap",
    correctOption: "Queue",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the time complexity of searching for an element in a hash table?",
    optionA: "O(1)",
    optionB: "O(log n)",
    optionC: "O(n)",
    correctOption: "O(1)",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which algorithm is used to find the maximum flow in a flow network?",
    optionA: "Ford-Fulkerson Algorithm",
    optionB: "Dijkstra's Algorithm",
    optionC: "Bellman-Ford Algorithm",
    correctOption: "Ford-Fulkerson Algorithm",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the primary advantage of using a priority queue over a regular queue?",
    optionA: "Faster insertion",
    optionB: "Constant-time access to elements",
    optionC: "Guaranteed order of elements",
    correctOption: "Guaranteed order of elements",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which data structure is used to implement a Last-In-First-Out (LIFO) behavior?",
    optionA: "Queue",
    optionB: "Stack",
    optionC: "LinkedList",
    correctOption: "Stack",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "What is the time complexity of searching for an element in a binary search tree?",
    optionA: "O(1)",
    optionB: "O(log n)",
    optionC: "O(n)",
    correctOption: "O(log n)",
  ),
  Quiz(
    name: "Data Structures and Algorithms",
    question: "Which algorithm is used to find the connected components in an undirected graph?",
    optionA: "Depth-First Search (DFS)",
    optionB: "Breadth-First Search (BFS)",
    optionC: "Dijkstra's Algorithm",
    correctOption: "Depth-First Search (DFS)",
  ),
];

List<Quiz> HardQues = [

  Quiz(
    name: "Databases and Management Systems",
    question: "What is a database?",
    optionA: "A collection of connected computers",
    optionB: "A structured collection of data",
    optionC: "A computer program",
    correctOption: "A structured collection of data",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "Which term is used to describe the structure of a database?",
    optionA: "Schema",
    optionB: "Algorithm",
    optionC: "Variable",
    correctOption: "Schema",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is SQL?",
    optionA: "A programming language for building websites",
    optionB: "A database management system",
    optionC: "A language for querying and managing databases",
    correctOption: "A language for querying and managing databases",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What does DBMS stand for?",
    optionA: "Database Management System",
    optionB: "Data Business Management System",
    optionC: "Digital Bookstore Management System",
    correctOption: "Database Management System",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is a primary key in a database?",
    optionA: "A key used for opening the database",
    optionB: "A unique identifier for a record in a table",
    optionC: "A password for accessing the database",
    correctOption: "A unique identifier for a record in a table",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "Which operation is used to retrieve data from a database?",
    optionA: "UPDATE",
    optionB: "INSERT",
    optionC: "SELECT",
    correctOption: "SELECT",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is normalization in the context of databases?",
    optionA: "Removing duplicates from a database",
    optionB: "Organizing data to reduce redundancy and dependency",
    optionC: "Encrypting data for security",
    correctOption: "Organizing data to reduce redundancy and dependency",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "Which type of database stores data in tables with rows and columns?",
    optionA: "Document-oriented database",
    optionB: "Graph database",
    optionC: "Relational database",
    correctOption: "Relational database",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is a foreign key in a database?",
    optionA: "A key used for locking the database",
    optionB: "A key used for accessing external files",
    optionC: "A field that links two tables together",
    correctOption: "A field that links two tables together",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "Which operation is used to modify existing data in a database?",
    optionA: "ALTER",
    optionB: "DELETE",
    optionC: "UPDATE",
    correctOption: "UPDATE",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is a record in a database?",
    optionA: "A collection of related tables",
    optionB: "A group of fields representing a single entity",
    optionC: "A type of query language",
    correctOption: "A group of fields representing a single entity",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "Which type of database is optimized for handling hierarchical data?",
    optionA: "Relational database",
    optionB: "Document-oriented database",
    optionC: "Graph database",
    correctOption: "Graph database",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is an index in a database?",
    optionA: "A list of all available tables",
    optionB: "A data structure that improves the speed of data retrieval",
    optionC: "A type of query language",
    correctOption: "A data structure that improves the speed of data retrieval",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "Which operation is used to add new data to a database?",
    optionA: "INSERT",
    optionB: "UPDATE",
    optionC: "SELECT",
    correctOption: "INSERT",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is ACID in the context of database transactions?",
    optionA: "A type of database programming language",
    optionB: "A property of a reliable database system",
    optionC: "A database schema",
    correctOption: "A property of a reliable database system",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "Which type of database stores data as key-value pairs?",
    optionA: "Relational database",
    optionB: "Document-oriented database",
    optionC: "NoSQL database",
    correctOption: "NoSQL database",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is a query in a database?",
    optionA: "A type of database schema",
    optionB: "A way to define database tables",
    optionC: "A request for retrieving or manipulating data",
    correctOption: "A request for retrieving or manipulating data",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "Which operation is used to remove data from a database?",
    optionA: "ALTER",
    optionB: "DELETE",
    optionC: "UPDATE",
    correctOption: "DELETE",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is data integrity in the context of databases?",
    optionA: "The process of backing up database files",
    optionB: "The accuracy and consistency of data stored in a database",
    optionC: "The encryption of sensitive data",
    correctOption: "The accuracy and consistency of data stored in a database",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is a transaction in a database?",
    optionA: "A single database operation",
    optionB: "A backup of the entire database",
    optionC: "A type of database table",
    correctOption: "A single database operation",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "Which type of database is designed to handle large volumes of data with high availability?",
    optionA: "Relational database",
    optionB: "NoSQL database",
    optionC: "Graph database",
    correctOption: "NoSQL database",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is a view in a database?",
    optionA: "A virtual table based on the result of a query",
    optionB: "A type of data structure",
    optionC: "An index for fast data retrieval",
    correctOption: "A virtual table based on the result of a query",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "Which operation is used to combine rows from two or more tables based on a related column?",
    optionA: "INSERT",
    optionB: "UPDATE",
    optionC: "JOIN",
    correctOption: "JOIN",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is a trigger in a database?",
    optionA: "A type of database user",
    optionB: "A type of query language",
    optionC: "A set of actions that automatically execute in response to an event",
    correctOption: "A set of actions that automatically execute in response to an event",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "Which type of database is suitable for storing and querying unstructured data like documents and images?",
    optionA: "Relational database",
    optionB: "Document-oriented database",
    optionC: "Graph database",
    correctOption: "Document-oriented database",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is data normalization in a database?",
    optionA: "Increasing data redundancy for faster access",
    optionB: "Organizing data to reduce duplication and dependency",
    optionC: "Converting data to a common format",
    correctOption: "Organizing data to reduce duplication and dependency",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "Which operation is used to remove a table from a database?",
    optionA: "DELETE",
    optionB: "DROP",
    optionC: "REMOVE",
    correctOption: "DROP",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is an ER diagram used for?",
    optionA: "Creating tables in a database",
    optionB: "Designing the user interface of a database",
    optionC: "Visualizing the relationships between database entities",
    correctOption: "Visualizing the relationships between database entities",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "Which type of database stores data in a flexible, schema-less format?",
    optionA: "Relational database",
    optionB: "Document-oriented database",
    optionC: "Graph database",
    correctOption: "Document-oriented database",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is a composite key in a database?",
    optionA: "A key made up of multiple fields",
    optionB: "A key used for encrypting data",
    optionC: "A key used for indexing",
    correctOption: "A key made up of multiple fields",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "Which operation is used to add a new column to an existing table?",
    optionA: "ALTER TABLE",
    optionB: "UPDATE TABLE",
    optionC: "MODIFY TABLE",
    correctOption: "ALTER TABLE",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is data warehousing?",
    optionA: "Storing data in a decentralized manner",
    optionB: "Storing data in a cloud-based environment",
    optionC: "Storing and managing data from various sources for analysis",
    correctOption: "Storing and managing data from various sources for analysis",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "Which operation is used to restrict the data that a user can access in a database?",
    optionA: "LOCK",
    optionB: "GRANT",
    optionC: "LIMIT",
    correctOption: "GRANT",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is a cursor in a database context?",
    optionA: "A visual representation of data",
    optionB: "A database index",
    optionC: "A control structure for traversing and manipulating database records",
    correctOption: "A control structure for traversing and manipulating database records",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "Which operation is used to group and summarize data in a database query?",
    optionA: "GROUP BY",
    optionB: "SORT",
    optionC: "FILTER",
    correctOption: "GROUP BY",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is data mining in the context of databases?",
    optionA: "Extracting valuable metals from computer components",
    optionB: "Analyzing and discovering patterns in large datasets",
    optionC: "Storing data in a secure manner",
    correctOption: "Analyzing and discovering patterns in large datasets",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "Which operation is used to retrieve distinct values from a column?",
    optionA: "UNIQUE",
    optionB: "DISTINCT",
    optionC: "FILTER",
    correctOption: "DISTINCT",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is a deadlock in a database?",
    optionA: "A type of query error",
    optionB: "A situation where two or more transactions are waiting for each other to release resources",
    optionC: "A form of data corruption",
    correctOption: "A situation where two or more transactions are waiting for each other to release resources",
  ),
  Quiz(
     name: "Databases and Management Systems",
    question: "Which operation is used to ensure data consistency and integrity in a database?",
    optionA: "BACKUP",
    optionB: "COMMIT",
    optionC: "ROLLBACK",
    correctOption: "COMMIT",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is the purpose of an index in a database?",
    optionA: "To prevent unauthorized access to data",
    optionB: "To store duplicate copies of data for backup",
    optionC: "To speed up data retrieval operations",
    correctOption: "To speed up data retrieval operations",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "Which operation is used to change existing data in a database?",
    optionA: "MODIFY",
    optionB: "ALTER",
    optionC: "UPDATE",
    correctOption: "UPDATE",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is a subquery in a database?",
    optionA: "A query used for subscription-based services",
    optionB: "A query nested within another query",
    optionC: "A query used for complex calculations",
    correctOption: "A query nested within another query",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "Which operation is used to remove a row from a table in a database?",
    optionA: "DELETE",
    optionB: "REMOVE",
    optionC: "DROP",
    correctOption: "DELETE",
  ),
  Quiz(
    name: "Databases and Management Systems",
    question: "What is database normalization?",
    optionA: "A process to reduce data integrity",
    optionB: "A process to increase data redundancy",
    optionC: "A process to organize data for efficient storage and retrieval",
    correctOption: "A process to organize data for efficient storage and retrieval",
  ),
];

class QuizProvider extends ChangeNotifier{
  SharedPreferences _prefs;

  QuizProvider(this._prefs){
    loadSaveResults();
    notifyListeners();
  }
  void loadSaveResults() async{
    await loadResult();
    await loadLevel();
    await loadQuizLists();
    notifyListeners();
  }

  //initalizing variables and getters
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
  //deleting methods for Lists

  
  void deleteResult(int index){
    _resultList.removeAt(index);
    _levelList.removeAt(index);
    print(_resultList);
    saveResult();
    notifyListeners();
  }

  //loading and saving methods from shared preferences
   Future<void> loadResult() async{ 
    try{
    String jsonString = await _prefs.getString("keyResult") ?? "[]";
    var jsonList = jsonDecode(jsonString) as List<dynamic>;
    _resultList = jsonList;
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
  Future<void> loadQuizLists() async{
    try{
      String jsonString = await _prefs.getString("quiz") ?? "[]";
      var jsonList = jsonDecode(jsonString) as List<dynamic>;
      quizList = jsonList.map<List<dynamic>>((innerList) {
      return (innerList as List).map((item) {
        return Quiz(
          name: item['name'] as String,
          question: item['question'] as String,
          optionA: item['optionA'] as String,
          optionB: item['optionB'] as String,
          optionC: item['optionC'] as String,
          correctOption: item['correctOption'] as String,
        )..tapOn = item['tapOn'] as bool;
      }).toList();
    }).toList();

      print(quizList);
    }
    catch(e){
      print("Error Loading Saved Quiz $e");
    }
  }
  void saveQuiz() async {
    try{
      print(quizList);
      String jsonString = jsonEncode(quizList.map(
    (innerList) => innerList.map(
      (quiz) => (quiz as Quiz).toJson(), // Assuming your Quiz class has toJson implemented
    ).toList(),
  ).toList(),);
      await _prefs.setString("quiz", jsonString);
    }
    catch(e){
      print("Saving quiz error $e");
    }
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
    level == "OOP"? clearProgress(quizeasy) : 
       level == "DSA"?   clearProgress(quiznormal):
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

 // personal quiz seperate methods for checking and marking mcqs results
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
      print(name);
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
    saveQuiz();
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
}