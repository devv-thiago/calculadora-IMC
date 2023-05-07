import 'package:flutter/material.dart';
import '../database/db.dart';
import '../models/pessoa.dart';

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({super.key});

  @override
  _CalculadoraScreenState createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  late double peso;
  late double altura;
  String resultado = '';
  DatabaseManager database = DatabaseManager();

  void resetResultado() {
    setState(() {
      resultado = '';
    });
  }

  @override
  Widget build(BuildContext context) {
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
                resetResultado();
                Pessoa usuario = Pessoa(peso, altura);
                double imc = usuario.calcularIMC();
                resultado = usuario.classificaIMC(imc);
                await database.inserirDados(peso, altura, resultado);
                setState(() {});
              },
              child: const Text(
                'Calcular',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)),
            height: 80,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              'Resultado: $resultado',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
