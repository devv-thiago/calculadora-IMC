import 'package:flutter/material.dart';

import 'models/pessoa.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  late double peso = double.parse(pesoController.text);
  late double altura = double.parse(alturaController.text);

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Calculadora de IMC')),
          backgroundColor: Colors.cyan,
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: pesoController,
                decoration: const InputDecoration(
                    label: Text('Peso'),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.solid))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                  controller: alturaController,
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
                      onPressed: () {
                        Pessoa.calcularIMC(peso, altura);
                      },
                      child: const Text(
                        'Calcular',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )))
            ],
          ),
        ),
        bottomNavigationBar:
            BottomNavigationBar(items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: 'Calcular'),
          BottomNavigationBarItem(
            icon: Icon(Icons.restore_rounded),
            label: 'Histórico',
          )
        ]),
      ),
    );
  }
}
