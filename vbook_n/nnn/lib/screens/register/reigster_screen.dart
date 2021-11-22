import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
                          fontSize: 16, color: Colors.white.withOpacity(0.5)),
                    )),
                height: 32,
                width: 200,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 120.0),
                  child: Image.asset(
                    "assets/images/vbook_w.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
          // ignore: prefer_const_constructors, duplicate_ignore
        ],
      )),
    );
  }
}
