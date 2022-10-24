import 'package:flutter/material.dart';
import 'package:foto_share_app/content/my_photos/my_photos.dart';

import '../content/add/add.dart';
import '../content/for_you/for_you.dart';
import '../content/wait/wait.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  var _pagesList = [
    ForYouPage(),
    WaitPage(),
    MyPhotosPage(),
    AddPage(),
  ];

  var _pagesListName = [
    "Para ti",
    "En espera",
    "Mis fotos",
    "Agregar",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pagesListName[_selectedIndex]),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pagesList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: _pagesListName[0],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hourglass_empty),
            label: _pagesListName[1],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: _pagesListName[2],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: _pagesListName[3],
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
