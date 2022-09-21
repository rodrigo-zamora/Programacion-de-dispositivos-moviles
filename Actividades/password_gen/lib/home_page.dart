// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generar contraseñas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text("32 caracteres:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(children: [
                    Text(password),
                    Expanded(child: SizedBox()),
                    IconButton(onPressed: () {}, icon: Icon(Icons.copy)),
                    IconButton(
                        onPressed: () {
                          password = generatePassword(32);
                          setState(() {});
                        },
                        icon: Icon(Icons.refresh))
                  ]),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  password = generatePassword(32);
                  setState(() {});
                },
                child: Text("Generar contraseñas")),
            OutlinedButton(
                onPressed: () {
                  resetPassword();
                },
                child: Text("Borrar contraseñas")),
          ],
        ),
      ),
    );
  }

  String generatePassword(int charNumber) {
    return String.fromCharCodes(
      List.generate(charNumber, (index) => Random().nextInt(48) + 60),
    );
  }

  void resetPassword() {
    password = "";
    setState(() {});
  }
}
