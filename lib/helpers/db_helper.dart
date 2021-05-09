// To interact with Database

import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  // insert
  static Future<void> insert(String table, Map<String, Object> data) async {
    // Get DB Path
    final dbPath = await sql.getDatabasesPath();

    // Query String (SQL)
    final sqlDb = await sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        return db.execute(
            'Create Table user_palces(id TEXT PRIMARY KEY, title TEXT, imsge TEXT)');
      },
      version: 1,
    );

    // Execute DB Work
    sqlDb.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace, // to overwrite existing data
    );
  }
}
