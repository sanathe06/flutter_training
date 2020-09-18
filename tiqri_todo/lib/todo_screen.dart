import 'package:flutter/material.dart';
import 'package:tiqri_todo/db/database.dart';

class TodoScreen extends StatefulWidget {
  TodoScreen({Key key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController todoController;
  int count;
  final databaseProvider = DatabaseProvider.instance;

  @override
  void initState() {
    super.initState();
    todoController = TextEditingController();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                save();
              }),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: todoController,
              onChanged: (value) {
                setState(() {
                  count = value.length;
                });
              },
              maxLines: 10,
            ),
            SizedBox(
              height: 16,
            ),
            Text("$count")
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    todoController?.dispose();
    super.dispose();
  }

  void save() async {
    var row = await databaseProvider.insert(todoController.text);
    if (row > 0) {
      Navigator.pop(context);
    }
  }

  void delete() async {
    /* var row = await databaseProvider.delete();
    if (row > 0) {
      Navigator.pop(context);
    } */
  }
}
