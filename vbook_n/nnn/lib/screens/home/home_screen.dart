// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nnn/root/root.dart';
import 'package:nnn/states/currentUser.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Logout"),
          onPressed: () async {
            CurrentUser currentUser =
                Provider.of<CurrentUser>(context, listen: false);
            String returnString = await currentUser.logOut();
            if (returnString == "Success") {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => OurRoot(),
                ),
                (route) => false,
              );
            }
          },
        ),
      ),
    );
  }
}
