import 'package:flutter/material.dart';
import 'package:nnn/root/root.dart';
import 'package:nnn/states/currentUser_state.dart';
import 'package:provider/provider.dart';

class HomeFormScreen extends StatefulWidget {
  const HomeFormScreen({Key? key}) : super(key: key);

  @override
  _HomeFormScreenState createState() => _HomeFormScreenState();
}

class _HomeFormScreenState extends State<HomeFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text("asd"),
        onPressed: () async {
          CurrentUserState currentUser =
              Provider.of<CurrentUserState>(context, listen: false);
          String returnString = await currentUser.logOut();
          if (returnString == "Success") {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => OurRoot(),
              ),
              (route) => false,
            );
          }
        },
      ),
    );
  }
}
