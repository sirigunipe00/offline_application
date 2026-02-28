import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._init();
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('sync_images.db');
    return _database!;
  }
  Future<void> deleteImage(int id) async {
  final db = await instance.database;
  await db.delete(
    'images',
    where: 'id = ?',
    whereArgs: [id],
  );
}

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE images (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        path TEXT NOT NULL,
        status TEXT NOT NULL -- 'pending' or 'synced'
      )
    ''');
  }

  Future<int> insertImage(String path) async {
    final db = await instance.database;
    return await db.insert('images', {'path': path, 'status': 'pending'});
  }

  Future<List<Map<String, dynamic>>> getPendingImages() async {
    final db = await instance.database;
    return await db.query('images', where: 'status = ?', whereArgs: ['pending']);
  }

  Future updateStatus(int id, String status) async {
    final db = await instance.database;
    await db.update('images', {'status': status}, where: 'id = ?', whereArgs: [id]);
  }
}