import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

// Classe de gerenciamento de banco de dados
class BancoDeDados{
  static final BancoDeDados _instancia = BancoDeDados._();
  static Database? _bancoDeDados;

  BancoDeDados._(); // construtor

  factory BancoDeDados() {
    return _instancia;
  }

  Future<Database> get bancoDeDados async {
    if (_bancoDeDados != null) {
      return _bancoDeDados!;
    }

    _bancoDeDados = await _inicializarBancoDeDados();
    return _bancoDeDados!;
  }

  Future<Database> _inicializarBancoDeDados() async {
    final caminhoDoBanco = await getDatabasesPath();
    final path = join(caminhoDoBanco, 'database.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: _criarTabelas,
    );
  }

  Future<void> _criarTabelas(Database db, int versao) async {
    await db.execute('''
      CREATE TABLE historico (
        id INTEGER PRIMARY KEY,
        peso REAL,
        altura REAL
      )
    ''');
  }

  Future<int> inserirUsuario(Map<String, dynamic> usuario) async {
    final db = await bancoDeDados;
    return db.insert('historico', usuario);
  }

  Future<List<Map<String, dynamic>>> listarUsuarios() async {
    final db = await bancoDeDados;
    return db.query('historico');
  }
}