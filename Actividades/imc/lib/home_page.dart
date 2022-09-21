// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMaleSelected = false;

  bool isFemaleSelected = false;

  var alturaController = TextEditingController();
  var pesoController = TextEditingController();

  final String _mj = ''' 
    Tabla del IMC para mujeres
    Edad      IMC ideal 
    16-17     19-24 
    18-18       19-24   
    19-24     19-24 
    25-34     20-25 
    35-44     21-26 
    45-54     22-27 
    55-64     23-28 
    65-90     25-30
      ''';

  final String _hb = ''' 
    Tabla del IMC para hombres
    Edad      IMC ideal 
    16-16       19-24   
    17-17       20-25   
    18-18       20-25   
    19-24     21-26 
    25-34     22-27 
    35-54     23-38 
    55-64     24-29 
    65-90     25-30
      ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC calculator'),
        actions: [
          IconButton(
            onPressed: () {
              reset();
            },
            icon: Icon(Icons.delete_forever),
            tooltip: "Reiniciar calculadora",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Ingrese sus datos para calcular el IMC"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.female,
                    color: isFemaleSelected ? Colors.indigo : Colors.grey,
                  ),
                  onPressed: () {
                    isFemaleSelected = true;
                    isMaleSelected = false;
                    setState(() {});
                  },
                ),
                VerticalDivider(),
                IconButton(
                  icon: Icon(
                    Icons.male,
                    color: isMaleSelected ? Colors.pink : Colors.grey,
                  ),
                  onPressed: () {
                    isFemaleSelected = false;
                    isMaleSelected = true;
                    setState(() {});
                  },
                ),
              ],
            ),
            TextField(
                controller: alturaController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Ingresar altura en metros"),
                    prefixIcon: Icon(Icons.square_foot))),
            SizedBox(height: 16),
            TextField(
                controller: pesoController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Ingresar peso en kilogramos"),
                    prefixIcon: Icon(Icons.monitor_weight))),
            TextButton(
                onPressed: () {
                  showResults();
                },
                child: Text("Calcular"))
          ],
        ),
      ),
    );
  }

  double calcularIMC() {
    double altura = double.parse(alturaController.text);
    double peso = double.parse(pesoController.text);
    return peso / (altura * altura);
  }

  void showResults() {
    if (isFemaleSelected) {
      showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              title: Text("IMC: ${calcularIMC()}"),
              content: Text(_mj),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Aceptar"))
              ],
            );
          }));
    } else if (isMaleSelected) {
      showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              title: Text("IMC: ${calcularIMC()}"),
              content: Text(_hb),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Aceptar"))
              ],
            );
          }));
    }
  }

  void reset() {
    isFemaleSelected = false;
    isMaleSelected = false;
    alturaController.clear();
    pesoController.clear();
    setState(() {});
  }
}
