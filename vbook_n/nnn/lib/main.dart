// ignore_for_file: prefer_const_constructors

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:nnn/root/root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nnn/states/currentUser_state.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // static FirebaseAnalytics analytics = FirebaseAnalytics();
  // static FirebaseAnalyticsObserver observer =
  //     FirebaseAnalyticsObserver(analytics: analytics);

  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUserState(),
      child: MaterialApp(
        //theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        //navigatorObservers: <NavigatorObserver>[observer],
        home: OurRoot(),
      ),
    );
    //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    //);
  }
}
