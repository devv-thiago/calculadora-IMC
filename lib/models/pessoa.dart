import 'dart:math';
import '../database/db.dart';
import 'package:sqflite/sqflite.dart';

class Pessoa {
  late double peso;
  late double altura;
  static late double indiceIMC;

  SQLiteDataBase pessoaDB = SQLiteDataBase();

  Pessoa();

  static double calcularIMC(double peso, double altura) {
    indiceIMC = peso / (pow(altura, 2));
    return indiceIMC;
  }

  static String classificaIMC(double IMC) {
    late String resultado;
    if (IMC < 16) {
      resultado = "Magreza Grave";
    } else if (IMC < 17) {
      resultado = "Magreza Moderada";
    } else if (IMC < 18.5) {
      resultado = "Magreza Leve";
    } else if (IMC < 25) {
      resultado = "Saudável";
    } else if (IMC < 30) {
      resultado = "Sobrepeso";
    } else if (IMC < 35) {
      resultado = "Obesidade Grau I";
    } else if (IMC < 40) {
      resultado = "Obesidade Grau II(severa)";
    } else {
      resultado = "Obesidade Grau III(mórbida)";
    }
    return resultado;
  }

  // inserir dados no banco
  Future inserirRegistro(
      Database db, String tabela, Map<String, dynamic> valores) async {
    await pessoaDB.inserirDados(db, tabela, valores);
  }
}