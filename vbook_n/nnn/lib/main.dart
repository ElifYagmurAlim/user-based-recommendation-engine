<<<<<<< Updated upstream
=======
// ignore_for_file: prefer_const_constructors

>>>>>>> Stashed changes
import 'package:flutter/material.dart';
import 'package:nnn/screens/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
<<<<<<< Updated upstream
=======
import 'package:nnn/states/currentUser_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
>>>>>>> Stashed changes

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
    //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    //);
  }
}
