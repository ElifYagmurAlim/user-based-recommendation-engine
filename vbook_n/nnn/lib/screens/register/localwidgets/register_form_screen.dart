// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nnn/screens/welcome/welcome_screen.dart';
import 'package:nnn/screens/widgets/container_form_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nnn/states/currentUser_state.dart';
import 'package:provider/provider.dart';

class RegisterFormScreen extends StatefulWidget {
  const RegisterFormScreen({Key? key}) : super(key: key);

  @override
  State<RegisterFormScreen> createState() => _RegisterFormScreen();
}

class _RegisterFormScreen extends State<RegisterFormScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  void _signUpUser(String email, String password, String userName,
      BuildContext context) async {
    CurrentUserState _currentUser =
        Provider.of<CurrentUserState>(context, listen: false);
    try {
      String returnString =
          await _currentUser.registerUser(email, password, userName);
      if (returnString == "Success") {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomeScreen(),
          ),
          (route) => false,
        );
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(returnString),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ContainerFormScreen(
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _userNameController,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade700),
              ),
              prefixIcon: Icon(
                Icons.person_outline,
                color: Colors.white,
              ),
              hintText: "Full Name",
              hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: _emailController,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade700),
              ),
              prefixIcon: Icon(
                Icons.alternate_email,
                color: Colors.white,
              ),
              hintText: "Email",
              hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: _passwordController,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade700),
              ),
              prefixIcon: Icon(
                Icons.lock_clock_outlined,
                color: Colors.white,
              ),
              hintText: "Password",
              hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: _confirmPasswordController,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade700),
              ),
              prefixIcon: Icon(
                Icons.lock_clock_outlined,
                color: Colors.white,
              ),
              hintText: "Confirm Password",
              hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 16.0,
          ),
          MaterialButton(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              height: 45.0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    SizedBox(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 255, 138, 57),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
            ),
            onPressed: () async {
              if (_passwordController.text == _confirmPasswordController.text) {
                _signUpUser(_emailController.text, _passwordController.text,
                    _userNameController.text, context);
              } else {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Passwords do not match"),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
