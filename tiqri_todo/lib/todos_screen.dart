import 'package:flutter/material.dart';
import 'package:tiqri_todo/common/styles.dart';
import 'package:tiqri_todo/db/database.dart';
import 'package:tiqri_todo/todo_screen.dart';
import 'package:tiqri_todo/ui/todo_item.dart';

class ToDosScreen extends StatefulWidget {
  ToDosScreen({Key key}) : super(key: key);

  @override
  _ToDosScreenState createState() => _ToDosScreenState();
}

class _ToDosScreenState extends State<ToDosScreen> {
  final databaseProvider = DatabaseProvider.instance;

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
        child: FutureBuilder(
          future: databaseProvider.getAll(),
          initialData: [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return TodoItem("", snapshot.data[index]["content"]);
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          onPressed: () async {
            await Navigator.push(
                context, MaterialPageRoute(builder: (context) => TodoScreen()));
            setState(() {});
          }),
    );
  }
}
