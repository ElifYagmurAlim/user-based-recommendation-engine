// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nnn/screens/home/home_screen.dart';
import 'package:nnn/screens/widgets/container_form_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({Key? key}) : super(key: key);

  @override
  State<LoginFormScreen> createState() => _LoginFormScreen();
}

class _LoginFormScreen extends State<LoginFormScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ContainerFormScreen(
      child: Column(
        children: <Widget>[
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
                        "Log in",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 231, 76, 60),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
            ),
            onPressed: () async {
              try {
                UserCredential userCredential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text);

                User? user = FirebaseAuth.instance.currentUser;

                if (user != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                }
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  final snackBar =
                      SnackBar(content: Text('No user found for that email.'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (e.code == 'wrong-password') {
                  final snackBar = SnackBar(
                      content: Text('Wrong password provided for that user.'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              } catch (e) {
                print(e);
              }
            },
          ),
        ],
      ),
    );
  }
}
