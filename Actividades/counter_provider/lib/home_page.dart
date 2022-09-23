// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, unused_element, prefer_const_constructors, unused_local_variable

import 'package:counter_provider/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contador v2.0'),
        ),
        body: Column(children: [
          Row(
            children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: context.watch<CounterProvider>().getColor),
                    height: 500,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.all(12),
                    child: Text(
                      context.watch<CounterProvider>().getContador.toString(),
                      style: TextStyle(fontSize: 75, color: Colors.white),
                    )),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                    onPressed: () {
                      context.read<CounterProvider>().cambiar_color(0);
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                          content: Text("Cambiar color a negro",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.black,
                        ));
                    },
                    color: Colors.black,
                    child: Text("BLACK",
                        style: TextStyle(
                          color: Colors.white,
                        ))),
                MaterialButton(
                    onPressed: () {
                      context.read<CounterProvider>().cambiar_color(1);
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                          content: Text("Cambiar color a rojo",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.red,
                        ));
                    },
                    color: Colors.red,
                    child: Text("RED",
                        style: TextStyle(
                          color: Colors.white,
                        ))),
                MaterialButton(
                    onPressed: () {
                      context.read<CounterProvider>().cambiar_color(2);
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                          content: Text("Cambiar color a azul",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.blue,
                        ));
                    },
                    color: Colors.blue,
                    child: Text("BLUE",
                        style: TextStyle(
                          color: Colors.white,
                        ))),
                MaterialButton(
                    onPressed: () {
                      context.read<CounterProvider>().cambiar_color(3);
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                          content: Text("Cambiar color a verde",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.green,
                        ));
                    },
                    color: Colors.green,
                    child: Text("GREEN",
                        style: TextStyle(
                          color: Colors.white,
                        ))),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 30,
                child: IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.white,
                  onPressed: () {
                    context.read<CounterProvider>().incrementar();
                  },
                ),
              ),
              CircleAvatar(
                radius: 30,
                child: IconButton(
                  icon: Icon(Icons.remove),
                  color: Colors.white,
                  onPressed: () {
                    context.read<CounterProvider>().decrementar();
                  },
                ),
              ),
              CircleAvatar(
                radius: 30,
                child: IconButton(
                  icon: Icon(Icons.restart_alt),
                  color: Colors.white,
                  onPressed: () {
                    context.read<CounterProvider>().resetear();
                  },
                ),
              ),
            ],
          ),
        ]));
  }
}
