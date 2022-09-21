// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: Column(
            children: [
              Text(
                "Auto Status",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 36),
              ),
              Container(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FloatingActionButton.extended(
                      icon: Icon(Icons.house),
                      label: Text("Botón 1"),
                      onPressed: () {},
                    ),
                    FloatingActionButton.extended(
                      icon: Icon(Icons.house),
                      label: Text("Botón 2"),
                      onPressed: () {},
                    ),
                    FloatingActionButton.extended(
                      icon: Icon(Icons.house),
                      label: Text("Botón 3"),
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
