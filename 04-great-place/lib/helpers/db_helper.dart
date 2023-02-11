// To interact with Database

import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
   // get database (locally used common method)
  static Future<Database> database() async {
    // Get Path of Database
    final dbPath = await sql.getDatabasesPath();

    // Query String (SQL)
    return sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
      },
      version: 1,
    );
  }

  // insert
  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();

    // Execute 'insert'
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace, // to overwrite existing data
    );
  }

  // getData
  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();

    // Execute 'query' to get all of data from the table
    return db.query(table);
  }
}
