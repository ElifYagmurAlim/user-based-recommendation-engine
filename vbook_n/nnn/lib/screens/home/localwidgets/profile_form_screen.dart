import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nnn/root/root.dart';
import 'package:nnn/screens/home/localwidgets/profilewidgets/change_password_form_screen.dart';
import 'package:nnn/screens/home/localwidgets/profilewidgets/change_username_form_screen.dart';
import 'package:nnn/services/database.dart';
import 'package:nnn/states/currentUser_state.dart';
import 'package:provider/provider.dart';

class ProfileFormScreen extends StatefulWidget {
  const ProfileFormScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileFormScreenState createState() => _ProfileFormScreenState();
}

class _ProfileFormScreenState extends State<ProfileFormScreen> {
  final userCollection = FirebaseFirestore.instance.collection('users');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String userName = '';

  @override
  void initState() {
    super.initState();
    fechData();
  }

  fechData() async {
    dynamic result = await VbookDatabase().getData();
    if (result == null) {
      print("error");
    } else {
      setState(() {
        //COK ONEMLI
        userName = result.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              margin: const EdgeInsets.only(top: 32.0, bottom: 8.0),
              color: Colors.orange,
              child: ListTile(
                onTap: () {
                  //open edit profile
                },
                title: Text(
                  userName,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.symmetric(horizontal: 18.0),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.account_circle_outlined,
                        color: Colors.orange),
                    title: Text("Change Username"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChangeUsernameForm()),
                      );
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey.shade400,
                  ),
                  ListTile(
                    leading: Icon(Icons.lock_outline, color: Colors.orange),
                    title: Text("Change Password"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChangePasswordForm()),
                      );
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.symmetric(horizontal: 18.0),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.logout_outlined, color: Colors.orange),
                    title: Text("Log Out"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () async {
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
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.symmetric(horizontal: 18.0),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.delete_outline, color: Colors.orange),
                    title: Text("Delete Account"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () async {
                      Widget deleteButton = TextButton(
                        child: Text("Delete my account"),
                        onPressed: () async {
                          try {
                            String userId = _auth.currentUser!.uid;
                            await FirebaseAuth.instance.currentUser!.delete();
                            VbookDatabase().deleteUser(userId);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OurRoot(),
                              ),
                              (route) => false,
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'requires-recent-login') {
                              print(
                                  'You have to resign for delete your account operation.');
                            }
                          }
                        },
                      );
                      Widget backButton = TextButton(
                        child: Text("Never mind , keep my account"),
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                      );
                      // set up the AlertDialog
                      AlertDialog alert = AlertDialog(
                        title: Text("Are you sure?"),
                        content: Text(
                            "Once you confirm, all of your account data will be permanently deleted."),
                        actions: [deleteButton, backButton],
                      );
                      // show the dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
