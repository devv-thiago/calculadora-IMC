import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:math';

class DatabaseManager {
  DatabaseManager() {
    WidgetsFlutterBinding.ensureInitialized();
    criarBancoDeDados();
  }

  Future<Database> criarBancoDeDados() async {
    final bancoDeDados = await openDatabase(
      'database.db',
      version: 1,
      onCreate: (db, versao) async {
        try {
          await db.execute('''
          CREATE TABLE historico (
            id INTEGER PRIMARY KEY,
            peso REAL,
            altura REAL,
            resultado TEXT
          )
        ''');
        } catch (e) {
          print('Excecao: $e');
        }
      },
    );

    return bancoDeDados;
  }

  inserirDados(double peso, double altura, String resultado) async {
    final db = await criarBancoDeDados(); // retorna meu banco de dados
    try {
      var resultado = Random().nextInt(9000);
      await db.insert('historico', {
        'id': resultado,
        'peso': peso,
        'altura': altura,
        'resultado': resultado
      });
    } catch (e) {
      print('Excecao $e');
    }
  }
}
