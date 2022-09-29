// ignore_for_file: prefer_const_constructors

import 'package:fake_blank_profile/profile/perfil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile/bloc/picture_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent)),
        home: BlocProvider(
          create: (context) => PictureBloc(),
          child: Perfil(),
        ));
  }
}
