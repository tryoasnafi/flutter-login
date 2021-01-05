import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user.dart';

class DatabaseHelper {
  static Database _db;
  final String dbName = 'main.db';
  final String tableUser = 'users';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnEmail = 'username';
  final String columnPassword = 'password';

  // Check database is created or not
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    // Get a location using getDatabasesPath
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);
    // When creating the db, create the table
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  // Create database and tables
  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableUser ($columnId INTEGER PRIMARY KEY, $columnName TEXT, $columnEmail TEXT UNIQUE, $columnPassword TEXT)");
    print("Table is created!");
  }

  // Insert user
  Future<User> insert(User user) async {
    var dbClient = await db;
    user.id = await dbClient.insert(tableUser, user.toMap());
    return user;
  }

  // Update user
  Future<int> update(User user) async {
    var dbClient = await db;
    return await dbClient.update(tableUser, user.toMap(), where: '$columnId = ?', whereArgs: [user.id]);
  }

  // Delete user
  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
        tableUser,
        where: '$columnId = ?',
        whereArgs: [id]);
  }

  Future<User> getLogin(String email, String password) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableUser,
      columns: [columnName, columnEmail, columnPassword],
      where: "$columnEmail = ? AND $columnPassword = ?",
      whereArgs: [email, password],
    );
    if (maps.length > 0) {
      print("User is existed!");
      return User.fromMap(maps.first);
    }
    return null;
  }

  // Close database connection
  Future close() async {
    var dbClient = await db;
    return await dbClient.close();
  }
}
