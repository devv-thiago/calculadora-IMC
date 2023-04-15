import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class SQLiteDataBase {
  Map<int, String> scripts = {
    1: ''' CREATE TABLE registros_imc (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          peso REAL,
          altura REAL,
					resultado TEXT
          );'''
  };

  static Database? db;

  Future<Database> obterDataBase() async {
    if (db == null) {
      return await iniciarBancoDeDados();
    } else {
      return db!;
    }
  }

  Future<Database> iniciarBancoDeDados() async {
    WidgetsFlutterBinding.ensureInitialized();
    var db = await openDatabase(
        path.join(await getDatabasesPath(), 'database.db'),
        version: scripts.length, onCreate: (Database db, int version) async {
      for (var i = 1; i <= scripts.length; i++) {
        await db.execute(scripts[i]!);
        debugPrint(scripts[i]!);
      }
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      for (var i = oldVersion + 1; i <= scripts.length; i++) {
        await db.execute(scripts[i]!);
        debugPrint(scripts[i]!);
      }
    });
    return db;
  }

  // inserir dados no banco
  Future<void> inserirDados(Database db, String tabela, Map<String, dynamic> valores) async {
    await db.insert(tabela, valores, conflictAlgorithm: ConflictAlgorithm.replace);
  }

}
