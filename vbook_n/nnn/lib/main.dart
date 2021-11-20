import 'package:flutter/material.dart';
import 'package:nnn/screens/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
    );
    //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    //);
  }
}
