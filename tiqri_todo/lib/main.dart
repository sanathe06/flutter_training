import 'package:flutter/material.dart';
import 'package:tiqri_todo/todos_screen.dart';

void main() {
  runApp(TiqriToDo());
}

class TiqriToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiqri ToDo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'NunitoSans'),
      home: ToDosScreen(),
    );
  }
}
