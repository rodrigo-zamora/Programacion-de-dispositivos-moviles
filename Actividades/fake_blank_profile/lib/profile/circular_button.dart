// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final IconData iconData;
  final Color backgroundColor;
  final String? title;
  final Function? action;

  CircularButton({
    super.key,
    required this.iconData,
    required this.backgroundColor,
    this.title,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            action!();
          },
          child: CircleAvatar(
            radius: 32,
            backgroundColor: backgroundColor,
            foregroundColor: Colors.white,
            child: Icon(
              iconData,
              size: 36,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(title ?? "No action"),
      ],
    );
  }
}
