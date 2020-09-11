import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  DatabaseProvider._privateConstructor();
  static final DatabaseProvider instance =
      DatabaseProvider._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _createDb();
    return _database;
  }

  _createDb() async {
    Directory directory = await getTemporaryDirectory();
    String path = join(directory.path, "todo.db");
    return await openDatabase(path, version: 2, onCreate: _onCreate);
  }

  FutureOr<void> _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE todos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        content TEXT NOT NULL,
        done INTEGER
      )
      ''');
  }

  Future<int> insert(String value) async {
    Database db = await instance.database;
    return db.insert("todos", {"content": value, "done": 0});
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    Database db = await instance.database;
    return await db.query("todos");
  }

  Future<int> update(Map<String, dynamic> rows) async {
    Database db = await instance.database;
    return await db
        .update("todos", rows, where: "id=?", whereArgs: [rows["id"]]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete("todos", where: "id=?", whereArgs: [id]);
  }
}
