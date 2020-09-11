import 'package:flutter/material.dart';
import 'package:tiqri_todo/common/styles.dart';

class TodoItem extends StatelessWidget {
  final String title;
  final String description;
  const TodoItem(
    this.title,
    this.description, {
    Key key,
  }) : super(key: key);

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
            Checkbox(value: false, onChanged: (value) {
              
            }),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$description",
                  style: TodoStyles.todoDescriptionStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
