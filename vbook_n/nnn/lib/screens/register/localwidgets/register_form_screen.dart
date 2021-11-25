// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nnn/screens/home/home_screen.dart';
import 'package:nnn/screens/welcome/welcome_screen.dart';
import 'package:nnn/screens/widgets/container_form_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterFormScreen extends StatefulWidget {
  const RegisterFormScreen({Key? key}) : super(key: key);

  @override
  State<RegisterFormScreen> createState() => _RegisterFormScreen();
}

class _RegisterFormScreen extends State<RegisterFormScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return ContainerFormScreen(
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _fullNameController,
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
              try {
                UserCredential userCredential = await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text);

                User? user = FirebaseAuth.instance.currentUser;

                if (user != null && !user.emailVerified) {
                  await user.sendEmailVerification();
                  final snackBar = SnackBar(
                      content: Text(
                          'Registeration Success! Please verify your email address to continue'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  );
                } else {
                  final snackBar = SnackBar(
                      content: Text(
                          'Account Creation Failed. Something Went Wrong.'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  final snackBar = SnackBar(
                      content: Text('The password provided is too weak.'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (e.code == 'email-already-in-use') {
                  final snackBar = SnackBar(
                      content:
                          Text('The account already exists for that email.'));
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
