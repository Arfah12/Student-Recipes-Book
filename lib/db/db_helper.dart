import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/recipe.dart';

class DBHelper {
  static Database? _database;

  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'recipes.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE recipes(
            id TEXT PRIMARY KEY,
            title TEXT,
            imagePath TEXT,
            category TEXT,
            cookingTime INTEGER,
            ingredients TEXT,
            steps TEXT,
            isFavorite INTEGER
          )
        ''');
      },
    );
    return _database!;
  }

  static Future<void> insertRecipe(Recipe recipe) async {
    final db = await getDatabase();

    await db.insert(
      'recipes',
      recipe.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Recipe>> fetchRecipes() async {
    final db = await getDatabase();
    final data = await db.query('recipes');
    return data.map((e) => Recipe.fromMap(e)).toList();
  }

  static Future<void> deleteRecipe(String id) async {
    final db = await getDatabase();
    await db.delete('recipes', where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> updateRecipe(Recipe recipe) async {
    final db = await getDatabase();
    await db.update(
      'recipes',
      recipe.toMap(),
      where: 'id = ?',
      whereArgs: [recipe.id],
    );
  }
}
