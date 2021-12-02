import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nnn/screens/home/localwidgets/profile_form_screen.dart';
import 'package:nnn/screens/widgets/container_form_screen.dart';
import 'package:nnn/services/database.dart';

class ChangeUsernameForm extends StatefulWidget {
  const ChangeUsernameForm({Key? key}) : super(key: key);

  @override
  _ChangeUsernameFormState createState() => _ChangeUsernameFormState();
}

class _ChangeUsernameFormState extends State<ChangeUsernameForm> {
  TextEditingController userNameController = TextEditingController();
  final userCollection = FirebaseFirestore.instance.collection('users');
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
        userNameController.text = result.toString();
      });
    }
  }

  Future<void> updateUser() {
    return userCollection
        .doc(_auth.currentUser!.uid)
        .update({'userName': userNameController.text})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Update Username'),
        backgroundColor: Colors.orange,
      ),
      body: ContainerFormScreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: userNameController,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade800),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade800),
                ),
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: Colors.grey.shade800,
                ),
                hintText: userNameController.text,
                hintStyle:
                    TextStyle(fontSize: 16.0, color: Colors.grey.shade800),
              ),
            ),
            SizedBox(
              height: 16.0,
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
                            "Change Username",
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
                  updateUser();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileFormScreen(),
                    ),
                    (route) => false,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
