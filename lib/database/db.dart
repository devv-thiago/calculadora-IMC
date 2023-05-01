import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class SQLiteDataBase {
  late Database db;

  SQLiteDataBase() {
    WidgetsFlutterBinding.ensureInitialized();
    _inicializarBancoDeDados();
  }

  Future<void> _inicializarBancoDeDados() async {
    db = await openDatabase(path.join(await getDatabasesPath(), 'database.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''CREATE TABLE registros_imc (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          peso REAL,
          altura REAL,
          resultado TEXT
        )''');
    });
  }

  Future<Database> obterDataBase() async {
    if (db == null) {
      await _inicializarBancoDeDados();
    }
    return db;
  }

  Future<void> inserirDados(
      String tabela, double peso, double altura, String resultadoImc) async {
    final db = await obterDataBase();
    await db.rawInsert(
        'INSERT INTO $tabela(peso, altura, resultado) VALUES (?, ?, ?)',
        [peso, altura, resultadoImc]);
  }
  // metodo para exclusao de registros
  
}

