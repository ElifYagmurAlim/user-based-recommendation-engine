// ignore_for_file: file_names, unused_local_variable, annotate_overrides, deprecated_member_us, prefer_const_constructors, deprecated_member_use
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nnn/root/root.dart';
import 'package:nnn/screens/welcome/welcome_screen.dart';
import 'package:nnn/screens/widgets/container_form_screen.dart';
import 'package:nnn/states/currentUser_state.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final userCollection = FirebaseFirestore.instance.collection('users');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
  }

  Future<void> updateUser() {
    return userCollection
        .doc(_auth.currentUser!.uid)
        .update({
          'email': emailController.text,
          'userName': userNameController.text
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    return ContainerFormScreen(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: userNameController,
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
                color: Colors.black,
              ),
              hintText: "Username",
              hintStyle: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: emailController,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
              color: Colors.pink,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade700),
              ),
              prefixIcon: Icon(
                Icons.alternate_email,
                color: Colors.black,
              ),
              hintText: "Email",
              hintStyle: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: passwordController,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
              color: Colors.pink,
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
                color: Colors.black,
              ),
              hintText: "Password",
              hintStyle: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 8.0,
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
                        "Update",
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
              await FirebaseAuth.instance.currentUser!
                  .updatePassword(passwordController.text);
              updateUser();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => WelcomeScreen(),
                ),
                (route) => false,
              );
// Create a credential
            },
          ),
          RaisedButton(
            child: Text("Logout"),
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
        ],
      ),
    );
  }
}
