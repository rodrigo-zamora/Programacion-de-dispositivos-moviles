// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, unused_element, prefer_const_constructors, prefer_final_fields

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class UsersDataProvider with ChangeNotifier {
  var _usersEndpoint = 'https://jsonplaceholder.typicode.com/users';
  List<dynamic> _usersList = [];
  List<dynamic> get getUsersList => _usersList;

  Future<dynamic> getUsers() async {
    try {
      var _response = await get(Uri.parse(_usersEndpoint));
      if (_response.statusCode == HttpStatus.ok) {
        var _content = jsonDecode(_response.body);
        _usersList = _content;
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
      _usersList = [];
      notifyListeners();
    }
  }
}
