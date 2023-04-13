import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sqlite;
import 'dart:async';

import 'package:sqflite/sqlite_api.dart';

class DatabaseManager {
  // Classe de gerenciamento de banco de dados
  late String databasePath;
  late final String dbName;

  DatabaseManager() {
    getDefaultDatabasePath();
  }

  Future getDefaultDatabasePath() async {
    databasePath =
        await sqlite.getDatabasesPath(); // Trás local padrão do database
    dbName = path.join(databasePath, 'demo.db'); // Define nome do database
    return dbName;
  }

// Cria database e tabela inicial
  Future openDB() async {
    var db = sqlite.openDatabase(dbName, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE Test (
              id INTEGER PRIMARY KEY, 
              name TEXT, 
              value INTEGER, 
              num REAL)
        """);
    });
    return db;
  }
}