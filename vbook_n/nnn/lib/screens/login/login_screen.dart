import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 76, 60),
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
              Padding(
                padding: EdgeInsets.only(top: 48.0, bottom: 4.0),
                child: MaterialButton(
                  color: Color.fromARGB(255, 255, 138, 57),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  onPressed: () {},
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
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
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
          ),

          // ignore: prefer_const_constructors, duplicate_ignore
        ],
      )),
    );
  }
}
