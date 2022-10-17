import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return await sql.openDatabase(path.join(dbPath, "QuizUDB.db"),
        onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE IF NOT EXISTS score(id INTEGER PRIMARY KEY,date TEXT,score INTEGER)");
      // return db;
    }, version: 1);
  }

  static Future<int> insert({required String date, required int score}) async {
    final db = await DBHelper.database();
    return db.insert(
      "score",
      {"date": date, "score": score},
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await DBHelper.database();
    return db.rawQuery("select * from score orderBy 'date' desc");
  }

  static Future<int> delete() async {
    final db = await DBHelper.database();
    return await db.delete("score");
  }
}
