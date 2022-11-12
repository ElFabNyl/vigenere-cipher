import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class BD {
  initialDB() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'crypto.db');

    // open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE user (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    });
  }
}
