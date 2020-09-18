import 'dart:convert';

import 'package:equatable/equatable.dart';

class ToDo extends Equatable {
  final int id;
  final String content;
  final bool done;
  ToDo({
    this.id,
    this.content,
    this.done,
  });

  ToDo copyWith({
    int id,
    String content,
    bool done,
  }) {
    return ToDo(
      id: id ?? this.id,
      content: content ?? this.content,
      done: done ?? this.done,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'done': done,
    };
  }

  factory ToDo.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ToDo(
      id: map['id'],
      content: map['content'],
      done: map['done'] == 0 ? false : true,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToDo.fromJson(String source) => ToDo.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        this.id,
        this.content,
        this.done,
      ];
}
