import 'package:flutter/material.dart';
import 'package:tiqri_todo/common/styles.dart';
import 'package:tiqri_todo/models/todo.dart';

class TodoItem extends StatefulWidget {
  final ToDo todo;
  final Function(ToDo todo, bool done) changeStateCallBack;
  final Function(ToDo todo) deleteCallBack;
  const TodoItem(
    this.todo,
    this.changeStateCallBack,
    this.deleteCallBack, {
    Key key,
  }) : super(key: key);

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool done;
  ToDo todo;

  @override
  void initState() {
    done = widget.todo.done;
    todo = widget.todo;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black45,
      child: Container(
        padding: EdgeInsets.only(
          top: 8,
          right: 8,
          bottom: 8,
        ),
        child: Row(
          children: [
            Checkbox(
                value: todo.done,
                onChanged: (value) {
                  todo = todo.copyWith(done: value);
                  widget.changeStateCallBack(todo, value);
                  setState(() {});
                }),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.todo.content}",
                    style: todo.done
                        ? TodoStyles.todoDescriptionStyle
                            .copyWith(decoration: TextDecoration.lineThrough)
                        : TodoStyles.todoDescriptionStyle,
                  ),
                ],
              ),
            ),
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  widget.deleteCallBack(todo);
                })
          ],
        ),
      ),
    );
  }
}
