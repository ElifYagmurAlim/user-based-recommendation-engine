// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nnn/root/root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nnn/states/currentUser.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OurRoot(),
      ),
    );
    //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    //);
  }
}
