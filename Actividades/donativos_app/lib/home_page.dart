// ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';

import 'donativos.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double donacionesAcumuladas = 0.0;
  double total = 10000;
  double totalPaypal = 0;
  double totalTarjeta = 0;
  double progress = 0.0;
  int? currentRadio;
  int? currentDropItem;

  var assetsRadioGroup = {
    0: "assets/paypal.png",
    1: "assets/credit-card.png",
  };

  var radioGroup = {
    0: "PayPal",
    1: "Tarjeta",
  };
  var dropItemsGroup = {
    0: 100,
    1: 350,
    2: 850,
    3: 1050,
    4: 9999,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Donaciones")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              "Es para una buena causa",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            Text(
              "Elija modo de donativo",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: radioGroupGenerator(),
              ),
            ),
            ListTile(
              title: Text("Cantidad a donar:"),
              trailing: DropdownButton(
                items: dropDownItemsGenerator(),
                value: currentDropItem,
                onChanged: (int? selected) {
                  currentDropItem = selected;
                  setState(() {});
                },
              ),
            ),
            LinearProgressIndicator(
              value: progress / 100,
              minHeight: 24,
            ),
            Text(
              "${progress.toStringAsFixed(2)}%",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: calcularDonaciones,
              color: Colors.cyan[100],
              child: Text("Donar"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.text_format),
        onPressed: () {
          // Navegar a otra pantalla
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Donativos(
                donativos: donacionesAcumuladas,
                acumuladoPaypal: totalPaypal,
                acumuladoTarjeta: totalTarjeta,
              ),
            ),
          );
          // Navigator.of(context).pushNamed("/donativos");
        },
      ),
    );
  }

  void calcularDonaciones() {
    if (currentRadio == 0) {
      // Paypal
      totalPaypal += currentDropItem!;
    } else {
      // Tarjeta
      totalTarjeta += currentDropItem!;
    }
    donacionesAcumuladas = totalPaypal + totalTarjeta;
    progress = donacionesAcumuladas / total * 100;
    progress = progress > 100.0 ? 100.0 : progress;
    setState(() {});
  }

  dropDownItemsGenerator() {
    return dropItemsGroup.entries
        .map(
          (dropDownelement) => DropdownMenuItem(
            value: dropDownelement.value,
            child: Text("${dropDownelement.value}"),
          ),
        )
        .toList();
  }

  radioGroupGenerator() {
    return radioGroup.entries
        .map(
          (radioElement) => ListTile(
            leading: Image.asset(assetsRadioGroup[radioElement.key]!),
            trailing: Radio(
              value: radioElement.key,
              groupValue: currentRadio,
              onChanged: (int? selected) {
                currentRadio = selected;
                setState(() {});
              },
            ),
            title: Text(radioElement.value),
          ),
        )
        .toList();
  }
}
