// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nnn/screens/login/login_screen.dart';
import 'package:nnn/screens/register/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(48.0)),
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
              style: TextStyle(fontSize: 12, color: Colors.grey[350]),
            ),
            height: 32,
            width: 200,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(0.5),
              child: Image.asset("assets/images/welcome_logo.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 48.0, bottom: 4.0),
            child: MaterialButton(
              color: Color.fromARGB(255, 255, 138, 57),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: Container(
                width: 275.0,
                height: 45.0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(
                        child: Text(
                          "Go to Sign In",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
            child: MaterialButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Container(
                width: 275.0,
                height: 45.0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        child: Text(
                          "No account yet? ",
                          style: TextStyle(color: Colors.grey[600]),
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
          ),
          Padding(padding: EdgeInsets.all(24.0)),
        ],
      )),
    );
  }
}
