// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'home_page.dart';
import 'donativos.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo)),
      initialRoute: "/homePage",
      routes: {
        "/homePage": (context) => HomePage(),
        "/donativos": (context) => Donativos(
              donativos: 0.0,
              acumuladoPaypal: 0.0,
              acumuladoTarjeta: 0.0,
            )
      },
    );
  }
}
