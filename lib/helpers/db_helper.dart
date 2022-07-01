import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbHelper {

  static Future<void> insert({required String table, required Map<String, Object> data}) async {
    final dbPath = await sql.getDatabasesPath();
    final sqlDb = await sql.openDatabase(path.join(dbPath, 'places.db'), onCreate: (db, version) {
      db.execute('CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
    }, version: 1);
    await sqlDb.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }
}