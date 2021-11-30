import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  final icon = CupertinoIcons.check_mark;

  return AppBar(
    leading: BackButton(
      color: Colors.grey[900],
    ),
    title: Text(
      "Settings",
      style: TextStyle(color: Colors.grey[900]),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: Colors.grey[900],
          ))
    ],
  );
}
