import 'package:flutter/material.dart';
import 'package:tiqri_todo/common/styles.dart';
import 'package:tiqri_todo/ui/todo_item.dart';

class ToDosScreen extends StatefulWidget {
  ToDosScreen({Key key}) : super(key: key);

  @override
  _ToDosScreenState createState() => _ToDosScreenState();
}

class _ToDosScreenState extends State<ToDosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TODO",
          style: TodoStyles.titleStyle,
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return TodoItem("First", "this is our first todo");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          onPressed: () {}),
    );
  }
}
