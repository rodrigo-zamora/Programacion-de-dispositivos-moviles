// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Column(
          children: [
            Image.network(
                'https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ITESO, Universidad Jesuita de Guadalajara"),
                    Text("San Pedro Tlaquepaque, Jal.")
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.thumb_up),
                ),
                Text("234"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      IconButton(
                          iconSize: 48,
                          onPressed: () {},
                          icon: Icon(Icons.email)),
                      Text("Correo")
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          iconSize: 48,
                          onPressed: () {},
                          icon: Icon(Icons.phone)),
                      Text("Teléfono")
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          iconSize: 48,
                          onPressed: () {},
                          icon: Icon(Icons.directions)),
                      Text("Ruta")
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                    "El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente), es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957.")
              ],
            )
          ],
        ));
  }
}
