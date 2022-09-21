// ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:donativos_app/home_page.dart';
import 'package:flutter/material.dart';

class Donativos extends StatefulWidget {
  final double? donativos;
  final double? acumuladoPaypal;
  final double? acumuladoTarjeta;

  Donativos({
    Key? key,
    required this.donativos,
    required this.acumuladoPaypal,
    required this.acumuladoTarjeta,
  }) : super(key: key);

  @override
  _DonativosState createState() => _DonativosState();
}

class _DonativosState extends State<Donativos> {
  @override
  Widget build(BuildContext context) {
    print("Donativos obtenidos: ${widget.donativos}");
    return Scaffold(
        appBar: AppBar(title: Text("Donativos obtenidos")),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Image.asset(
                    "assets/paypal.png",
                    width: 50,
                    height: 50,
                  ),
                ),
                Text(
                  "${widget.acumuladoPaypal}",
                  style: TextStyle(fontSize: 32),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Image.asset(
                    "assets/credit-card.png",
                    width: 50,
                    height: 50,
                  ),
                ),
                Text(
                  "${widget.acumuladoTarjeta}",
                  style: TextStyle(fontSize: 32),
                )
              ],
            ),
            Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            Row(children: [
              Container(
                padding: EdgeInsets.all(17),
                child: Icon(
                  Icons.arrow_upward,
                  size: 32,
                ),
              ),
              Text(
                "${widget.donativos}",
                style: TextStyle(fontSize: 32),
              )
            ]),
            Row(
              children: [
                if (widget.donativos! >= 10000)
                  Expanded(
                    child: Image.asset(
                      "assets/signboard.png",
                    ),
                  )
              ],
            )
          ],
        ));
  }
}
