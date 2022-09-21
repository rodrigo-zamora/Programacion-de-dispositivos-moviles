// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Item_Movie extends StatelessWidget {
  final Map<String, String> movie;

  Item_Movie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(children: [
          Positioned.fill(
              child: Image.network(fit: BoxFit.fill, "${movie["image"]}")),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                padding: EdgeInsets.all(4),
                color: Colors.blue,
                child: Column(children: [
                  Text("${movie["title"]}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Text("${movie["description"]}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))
                ])),
          )
        ]),
      ),
    );
  }
}
