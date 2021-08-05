import "package:path/path.dart";
import 'package:sqflite/sqflite.dart';

import '../models/model_users.dart';

class ServiceUsersSQL {
  static final ServiceUsersSQL _serviceSQL = ServiceUsersSQL._internal();

  factory ServiceUsersSQL() {
    return _serviceSQL;
  }

  ServiceUsersSQL._internal();


  static Database? _database;

  final String tableName = 'users';
  final String fileName = 'users.db';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB();
      return _database!;
    }
  }

  _initDB() async {
    final documentsDirectory = await getDatabasesPath();
    String path = join(documentsDirectory, fileName);
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
    return _database;
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableName (
     sqlId INTEGER PRIMARY KEY autoincrement,
     id INTEGER NOT NULL,
     email TEXT NOT NULL,
     first_name TEXT NOT NULL,
     last_name TEXT NOT NULL,
     avatar TEXT NOT NULL
    )
    ''');
  }

  Future close() async {
    final db = await database;
    db.close();
  }

  /// CRUD for internal SQL BASE

  Future<ModelUser> createModelUser(ModelUser modelUser) async {
    final db = await _serviceSQL.database;
    final id = await db.insert(tableName, modelUser.toJson());
    modelUser.sqlId = id;
    return modelUser;
  }

  Future<ModelUser?> readModelUser(int? id) async {
    ModelUser? modelUser;
    final db = await _serviceSQL.database;

    final jsonList = await db.query(tableName,
        columns: ["sqlId", "id", "email", "first_name", "last_name", "avatar"],
        where: 'id = ?',
        whereArgs: [id]);
    if (jsonList.isNotEmpty) {
      modelUser = ModelUser.fromJson(jsonList[0]);
    }
    return modelUser;
  }

  Future<List<ModelUser>> readAllModelUser() async {
    final db = await _serviceSQL.database;
    final result = await db.query(tableName, orderBy: 'id ASC');
    return result.map((json) => ModelUser.fromJson(json)).toList();
  }

  Future<int> update(ModelUser modelUser) async {
    final db = await _serviceSQL.database;
    if (modelUser.sqlId == null) {
      return 0;
    }
    return db.update(
      tableName,
      modelUser.toJson(),
      where: "sqlId = ?",
      whereArgs: [modelUser.sqlId],
    );
  }

  Future<int> delete(int sqlId) async {
    final db = await _serviceSQL.database;
    return await db.delete(tableName, where: "sqlId = ?", whereArgs: [sqlId]);
  }
}
