import 'dart:math';
import 'package:calculadora_imc/models/calculadora_imc.dart';

import '../database/db.dart';
import 'package:sqflite/sqflite.dart';

class Pessoa implements CalculadoraIMC{
  late double peso;
  late double altura;
  late String resultado;
  late double imc;

  SQLiteDataBase pessoaDB = SQLiteDataBase();

  Pessoa(this.peso, this.altura);

  // inserir dados no banco
  Future inserirDados(String tabela, double peso, double altura, String resultado) async {
    pessoaDB.inserirDados('registros_imc', peso, altura, resultado);
  }

  // métodos classe calculadora
  @override
  double calcularIMC() {
    imc = peso / (pow(altura, 2));
    return imc;
  }

  @override
  String classificaIMC(double imc) {
    if (imc < 16) {
      resultado = "Magreza Grave";
    } else if (imc < 17) {
      resultado = "Magreza Moderada";
    } else if (imc < 18.5) {
      resultado = "Magreza Leve";
    } else if (imc < 25) {
      resultado = "Saudável";
    } else if (imc < 30) {
      resultado = "Sobrepeso";
    } else if (imc < 35) {
      resultado = "Obesidade Grau I";
    } else if (imc < 40) {
      resultado = "Obesidade Grau II(severa)";
    } else {
      resultado = "Obesidade Grau III(mórbida)";
    }
    return resultado;
  }
}