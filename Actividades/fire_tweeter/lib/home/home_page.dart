import 'package:fire_tweeter/home/data_table_page.dart';
import 'package:fire_tweeter/profile/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data list firebase"),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.table_rows),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DataTablePage(),
                ),
              );
            },
          ),
        ],
      ),
      // TODO: Lista de Documentos Firebase para leer datos de  Cloud Firestore (pre hecha de Flutter Fire UI)
      body: Center(
        child: Text("TODO: Leer los documentos de la BDs y pintarlos"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // TODO: crear pagina para crear fire tweets**
        },
      ),
    );
  }
}
// https://firebase.flutter.dev/docs/ui/widgets
