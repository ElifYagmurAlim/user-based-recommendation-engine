// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded Column Sample'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(32.0)),
            // ignore: prefer_const_constructors, duplicate_ignore
            SizedBox(
              // ignore: prefer_const_constructors
              child: Text(
                'Welcome!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32),
              ),
              height: 32,
              width: 200,
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            SizedBox(
              child: Text(
                'Sign in or create a new account',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
              height: 32,
              width: 200,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(0.5),
                child: Image.asset("assets/images/welcomelogo.png"),
              ),
            ),
            SizedBox(
              child:
                  Text('Deliver features faster', textAlign: TextAlign.center),
              height: 100,
              width: 100,
            ),
            SizedBox(
              child:
                  Text('Deliver features faster', textAlign: TextAlign.center),
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
