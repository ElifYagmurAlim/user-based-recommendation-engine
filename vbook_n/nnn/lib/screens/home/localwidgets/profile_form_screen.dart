import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nnn/screens/home/localwidgets/profilewidgets/change_password_form_screen.dart';
import 'package:nnn/screens/home/localwidgets/profilewidgets/change_username_form_screen.dart';

class ProfileFormScreen extends StatefulWidget {
  const ProfileFormScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileFormScreenState createState() => _ProfileFormScreenState();
}

class _ProfileFormScreenState extends State<ProfileFormScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final userCollection = FirebaseFirestore.instance.collection('users');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> updateUser() async {
    if (passwordController.text == confirmpasswordController.text) {
      await FirebaseAuth.instance.currentUser!
          .updatePassword(passwordController.text);
    }
    userCollection
        .doc(_auth.currentUser!.uid)
        .update({'userName': userNameController.text})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
    return 'Success';
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
                  "John Doe",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.symmetric(horizontal: 32.0),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.account_circle_outlined,
                        color: Colors.orange),
                    title: Text("Change User Name"),
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
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Stats",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam consequat dignissim rutrum. Nullam ultrices lorem et accumsan vulputate. Pellentesque ut efficitur massa. Sed et lacinia erat, eget iaculis ante. Duis a bibendum ante, quis volutpat orci. Aliquam id pulvinar ligula, vel feugiat ex. Nulla euismod sapien vehicula nisl commodo tincidunt. Proin mi mauris, suscipit eget luctus ac, mattis sit amet nisl. Maecenas blandit massa id diam cursus, in vehicula quam pellentesque."),
                  ],
                )),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.symmetric(horizontal: 32.0),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.delete_outline, color: Colors.orange),
                    title: Text("Delete Account"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
