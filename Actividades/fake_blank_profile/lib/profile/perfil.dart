// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, unused_element, prefer_const_constructors, unused_local_variable, unnecessary_import, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_unnecessary_containers

import 'package:fake_blank_profile/profile/circular_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/picture_bloc.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Perfil de usuario'),
        ),
        body: Column(children: [
          SizedBox(
            height: 20,
          ),
          _userPicture(),
          Text(
            "Bienvenido",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black),
          ),
          Text("Usuario ${UniqueKey()}"),
          SizedBox(
            height: 24,
          ),
          _userActions(context)
        ]));
  }

  Widget _userActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircularButton(
          backgroundColor: Colors.blueAccent,
          iconData: Icons.abc,
        ),
        CircularButton(
          backgroundColor: Colors.orange,
          iconData: Icons.camera_alt,
          title: "Tomar foto",
          action: () {
            BlocProvider.of<PictureBloc>(context).add(ChangeImageEvent());
          },
        ),
        CircularButton(
          backgroundColor: Colors.green[700]!,
          iconData: Icons.play_arrow,
          title: "Tutorial",
        ),
      ],
    );
  }

  BlocConsumer<PictureBloc, PictureState> _userPicture() {
    return BlocConsumer<PictureBloc, PictureState>(
      listener: (context, state) {
        if (state is PictureErrorState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
        }
      },
      builder: (context, state) {
        if (state is PictureSelectedState) {
          return CircleAvatar(
            radius: 75,
            child: Image.file(
              state.picture!,
              fit: BoxFit.cover,
            ),
          );
        } else {
          return CircleAvatar(
            radius: 75,
            backgroundImage:
                NetworkImage('https://www.woolha.com/media/2020/03/eevee.png'),
          );
        }
      },
    );
  }
}
