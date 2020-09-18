import 'package:flutter/material.dart';
import 'package:tiqri_todo/common/styles.dart';
import 'package:tiqri_todo/db/database.dart';
import 'package:tiqri_todo/models/todo.dart';
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
                  final todo = ToDo.fromMap(snapshot.data[index]);
                  return TodoItem(todo, (ToDo todo, bool done) {
                    print(todo.toString());
                    databaseProvider
                        .update({"id": todo.id, "done": todo.done ? 1 : 0});
                  }, (ToDo todo) {
                    print(todo.toString());
                    databaseProvider.delete(todo.id);
                    setState(() {});
                  });
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
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
