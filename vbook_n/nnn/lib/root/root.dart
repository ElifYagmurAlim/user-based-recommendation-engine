// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:nnn/screens/home/home_screen.dart';
import 'package:nnn/screens/welcome/welcome_screen.dart';
import 'package:nnn/states/currentUser_state.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class OurRoot extends StatefulWidget {
  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    CurrentUserState currentUser =
        Provider.of<CurrentUserState>(context, listen: false);
    String returnString = await currentUser.onStartUp();
    if (returnString == "Success") {
      setState(() {
        authStatus = AuthStatus.signedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        retVal = WelcomeScreen();
        break;
      case AuthStatus.signedIn:
        retVal = HomeScreen();
        break;
    }
    return retVal;
  }
}
