import 'package:Inspection/models/mill.dart';
import "package:sqflite/sqflite.dart";
import 'package:path/path.dart';

class MillDatabase {
  static final MillDatabase instance = MillDatabase.init();
  MillDatabase.init();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDB('mill.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableMill(
        

      )
    ''');
  }
}
