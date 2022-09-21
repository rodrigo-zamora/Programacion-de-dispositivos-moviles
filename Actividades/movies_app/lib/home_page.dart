// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, unused_field

import 'package:flutter/material.dart';
import 'package:movies_app/item_movie.dart';

class Home_page extends StatelessWidget {
  final List<Map<String, String>> _listElements = [
    {
      "title": "Star wars",
      "description": "Ranking: ★★★",
      "image": "https://i.imgur.com/tpHc9cS.jpg",
    },
    {
      "title": "Black widow",
      "description": "Ranking: ★★★★",
      "image": "https://i.imgur.com/0NTTbFn.jpg",
    },
    {
      "title": "Frozen 2",
      "description": "Ranking: ★★★",
      "image": "https://i.imgur.com/noNCN3V.jpg",
    },
    {
      "title": "Joker",
      "description": "Ranking: ★★★★",
      "image": "https://i.imgur.com/trdzMAl.jpg",
    },
  ];

  Home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: _moviesArea(context),
    );
  }

  Widget _moviesArea(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      child: _movieList(),
    );
  }

  Widget _movieList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _listElements.length,
      itemBuilder: (BuildContext context, int index) {
        return Item_Movie(movie: _listElements[index]);
      },
    );
  }
}
