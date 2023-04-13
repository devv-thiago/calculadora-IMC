import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sqlite;
import 'dart:async';

// Classe de gerenciamento de banco de dados
class BancoDeDados {
  Future<sqlite.Database> openDatabase() async {
    final dbPath = path.join(await sqlite.getDatabasesPath(), 'dbTeste.db');
    return await sqlite.openDatabase(dbPath);
  }
}
