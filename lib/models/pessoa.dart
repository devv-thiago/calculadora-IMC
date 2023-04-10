import 'dart:math';

class Pessoa {
  final String nome;
  final double peso;
  final double altura;

  Pessoa({required this.nome, required this.peso, required this.altura});

  double calcularIMC(double peso, double altura) {
    return peso / (pow(altura, 2));
  }

  String classificaIMC(double IMC) {
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
}
