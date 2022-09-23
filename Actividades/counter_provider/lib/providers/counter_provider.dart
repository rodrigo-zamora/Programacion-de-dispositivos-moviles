import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int contador = 0;
  Color color = Colors.grey;
  int get getContador => contador;
  Color get getColor => color;

  void incrementar() {
    contador++;
    notifyListeners();
  }

  void decrementar() {
    contador--;
    notifyListeners();
  }

  void resetear() {
    contador = 0;
    color = Colors.grey;
    notifyListeners();
  }

  void cambiar_color(int new_color) {
    if (new_color == 0) {
      color = Colors.black;
    } else if (new_color == 1) {
      color = Colors.red;
    } else if (new_color == 2) {
      color = Colors.blue;
    } else if (new_color == 3) {
      color = Colors.green;
    } else {
      color = Colors.grey;
    }
    notifyListeners();
  }
}
