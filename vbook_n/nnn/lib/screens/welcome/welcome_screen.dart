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
          child: Container(
        color: Colors.white,
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
            MaterialButton(
              color: Color.fromARGB(255, 255, 138, 57),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              onPressed: () {},
              child: Container(
                width: 275.0,
                height: 40.0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ]),
              ),
            ),
            MaterialButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.grey),
              ),
              onPressed: () {},
              child: Container(
                width: 275.0,
                height: 40.0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(
                        child: Text(
                          "No account yet?",
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 138, 57)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ]),
              ),
            ),
            Padding(padding: EdgeInsets.all(16.0)),
          ],
        ),
      )),
    );
  }
}
