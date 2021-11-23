// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ContainerFormScreen extends StatelessWidget {
  final Widget child;

  const ContainerFormScreen({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.2),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(.1),
            blurRadius: 15.0,
            spreadRadius: 1.0,
            offset: Offset(
              0.0,
              3.0,
            ),
          )
        ],
      ),
      child: child,
    );
  }
}
