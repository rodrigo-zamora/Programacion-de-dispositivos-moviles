// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, unused_element, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:request_provider/providers/users_data_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Request Provider'),
          actions: [
            IconButton(
              onPressed: () {
                context.read<UsersDataProvider>().getUsers();
              },
              icon: Icon(Icons.download),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: context.watch<UsersDataProvider>().getUsersList.length,
          itemBuilder: (BuildContext context, int index) {
            var _itemUser =
                context.read<UsersDataProvider>().getUsersList[index];
            return ListTile(
              title: Text(_itemUser['name']),
              subtitle: Text(_itemUser['email']),
            );
          },
        ));
  }
}
