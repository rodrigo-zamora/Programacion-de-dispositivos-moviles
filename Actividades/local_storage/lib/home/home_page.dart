// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  var _titleC = TextEditingController();
  var _contentC = TextEditingController();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: ListView(
        children: [
          _itemSaveOrRead(
            context,
            "tempDirectory",
            "/data/user/0/com.app.package/cache",
          ),
          Divider(),
          _itemSaveOrRead(
            context,
            "externalStorageDirectory",
            "/storage/emulated/0/Android/data/com.app.package/files",
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _titleC,
              decoration: InputDecoration(
                label: Text("Titulo del archivo"),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _contentC,
              maxLines: 2,
              maxLength: 100,
              decoration: InputDecoration(
                label: Text("Contenido del archivo"),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemSaveOrRead(
    BuildContext context,
    String title,
    String subtitle,
  ) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: IconButton(
        tooltip: "Guardar archivo",
        onPressed: () {},
        icon: Icon(FontAwesomeIcons.fileSignature),
      ),
      trailing: IconButton(
        tooltip: "Leer archivo",
        onPressed: () {},
        icon: Icon(FontAwesomeIcons.readme),
      ),
    );
  }
}
