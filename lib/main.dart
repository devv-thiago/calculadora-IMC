import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora de IMC'),
          backgroundColor: Colors.cyan,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          child: Column(
            children: [
              TextField(
                controller: pesoController,
                decoration: const InputDecoration(label: Text('Peso')),
              ),
              TextField(
                  controller: alturaController,
                  decoration: const InputDecoration(label: Text('Altura'))),
              ElevatedButton(onPressed: () {}, child: const Text('Calcular'))
            ],
          ),
        ),
      ),
    );
  }
}
