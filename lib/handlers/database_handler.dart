import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart'; // Import the path package

class DatabaseHandler {
  static final DatabaseHandler _instance = DatabaseHandler._privateConstructor();
  static Database? _database;

  DatabaseHandler._privateConstructor();

  static DatabaseHandler get instance => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, 'bmi_calculator.db');
      return await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE bmi_records (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              timestamp INTEGER,
              bmi REAL,
              weight REAL
            )
          ''');
        },
      );
    } catch (e) {
      print("Error initializing database: $e");
      // Depending on the app's needs, might rethrow or handle differently
      rethrow;
    }
  }

  Future<void> saveBmiRecord(double bmi, double weight) async {
    try {
      final db = await database;
      await db.insert(
        'bmi_records',
        {
          'timestamp': DateTime.now().millisecondsSinceEpoch,
          'bmi': bmi,
          'weight': weight,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } on DatabaseException catch (e) {
      print("DatabaseException while saving BMI record: $e");
      // Optionally, rethrow or handle as a custom app exception
    } catch (e) {
      print("Unexpected error while saving BMI record: $e");
    }
  }

  Future<List<Map<String, dynamic>>> getBmiHistory() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(
        'bmi_records',
        orderBy: 'timestamp DESC',
      );
      return maps;
    } on DatabaseException catch (e) {
      print("DatabaseException while getting BMI history: $e");
      return []; // Return empty list on error
    } catch (e) {
      print("Unexpected error while getting BMI history: $e");
      return []; // Return empty list on error
    }
  }
}
