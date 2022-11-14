import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Normal'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Con ícono'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Con imagen'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Cada minuto'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Con acción'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
