import 'package:calculadora_imc/pages/historico.dart';
import 'package:calculadora_imc/pages/home.dart';
import 'package:flutter/material.dart';
import './database/db.dart';

void main() async {
  final db = DatabaseManager();
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexPagina = 0;
  List<Widget> paginas = [
    const CalculadoraScreen(),
    HistoricoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Calculadora de IMC')),
          backgroundColor: Colors.black,
        ),
        body: paginas[indexPagina],
        bottomNavigationBar: BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: indexPagina,
            items: const <BottomNavigationBarItem>[
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

  void onTabTapped(int index) {
    setState(() {
      indexPagina = index;
    });
  }
}
