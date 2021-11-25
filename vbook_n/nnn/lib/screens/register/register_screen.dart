// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'localwidgets/register_form_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 255, 138, 57),
      body: Center(
          child: Stack(
        children: <Widget>[
          FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 1,
            child: Image.asset(
              "assets/images/chroma_red.png",
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomLeft,
            ),
          ),
          Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(48.0)),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 120.0),
                  child: Image.asset(
                    "assets/images/vbook_logo_w.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SizedBox(
                child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'WELCOME TO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18, color: Colors.white.withOpacity(0.8)),
                    )),
                height: 32,
                width: 200,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100.0),
                  child: Image.asset(
                    "assets/images/vbook_w.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(24.0)),
              SizedBox(
                child: Padding(
                    padding: EdgeInsets.only(top: 2.0, bottom: 4.0),
                    child: Text(
                      'Create An Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16, color: Colors.white.withOpacity(0.7)),
                    )),
                height: 28,
                width: 200,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: RegisterFormScreen(),
              )
            ],
          ),
        ],
      )),
    );
  }
}
