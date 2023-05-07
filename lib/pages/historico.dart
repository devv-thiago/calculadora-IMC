import 'package:flutter/material.dart';
import '../database/db.dart';

class HistoricoScreen extends StatefulWidget {
  HistoricoScreen({Key? key}) : super(key: key);

  @override
  _HistoricoScreenState createState() => _HistoricoScreenState();
}

class _HistoricoScreenState extends State<HistoricoScreen> {
  late List<Map<String, dynamic>> _resultados = [];

  @override
  void initState() {
    super.initState();
    _carregarResultados();
  }

  Future<void> _carregarResultados() async {
    DatabaseManager database = DatabaseManager();
    List<Map<String, dynamic>> resultados = await database.obterDados();
    setState(() {
      _resultados = resultados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _resultados.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> resultado = _resultados[index];
          return Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.black54,
            )),
            child: ListTile(
              title: Text(
                '${resultado['resultado']}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              subtitle: Text(
                'Peso: ${resultado['peso'].toStringAsFixed(2)} Kg - Altura: ${resultado['altura'].toStringAsFixed(2)} M',
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
