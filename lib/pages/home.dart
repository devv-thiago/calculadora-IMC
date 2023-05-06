import 'package:flutter/material.dart';
import '../database/db.dart';
import '../models/pessoa.dart';

class CalculadoraScreen extends StatelessWidget {
  const CalculadoraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController pesoController = TextEditingController();

    TextEditingController alturaController = TextEditingController();

    late double peso;

    late double altura;

    DatabaseManager database = DatabaseManager();
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            keyboardType: TextInputType.number,
            controller: pesoController,
            onChanged: (value) => peso = double.parse(pesoController.text),
            decoration: const InputDecoration(
                label: Text('Peso'),
                border: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.solid))),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
              keyboardType: TextInputType.number,
              controller: alturaController,
              onChanged: (value) =>
                  altura = double.parse(alturaController.text),
              decoration: const InputDecoration(
                  label: Text('Altura'),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.solid)))),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                  onPressed: () async {
                    Pessoa usuario = Pessoa(peso, altura);
                    double imc = usuario.calcularIMC();
                    String resultado = usuario.classificaIMC(imc);
                    database.inserirDados(peso, altura, resultado);
                  },
                  child: const Text(
                    'Calcular',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )))
        ],
      ),
    );
  }
}
