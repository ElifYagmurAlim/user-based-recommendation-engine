import 'package:flutter/material.dart';
import 'package:nnn/screens/home/home_screen.dart';
import 'package:nnn/screens/welcome/welcome_screen.dart';
import 'package:nnn/states/currentUser.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class OurRoot extends StatefulWidget {
  const OurRoot({Key? key}) : super(key: key);

  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus authStatus = AuthStatus.notSignedIn;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    CurrentUser currentUser = Provider.of<CurrentUser>(context, listen: false);
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
