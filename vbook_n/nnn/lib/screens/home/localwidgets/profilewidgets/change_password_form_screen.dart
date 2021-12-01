import 'package:flutter/material.dart';
import 'package:nnn/screens/widgets/container_form_screen.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({Key? key}) : super(key: key);

  @override
  _ChangePasswordFormState createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Update Password'),
        backgroundColor: Colors.orange,
      ),
      body: ContainerFormScreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              //controller: userNameController,
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
                  Icons.vpn_key_outlined,
                  color: Colors.grey.shade800,
                ),
                hintText: "Old Password",
                hintStyle:
                    TextStyle(fontSize: 16.0, color: Colors.grey.shade800),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: double.infinity,
              height: 1.0,
              color: Colors.grey.shade400,
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              //controller: userNameController,
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
                  Icons.lock_open_outlined,
                  color: Colors.grey.shade800,
                ),
                hintText: "New Password",
                hintStyle:
                    TextStyle(fontSize: 16.0, color: Colors.grey.shade800),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: double.infinity,
              height: 1.0,
              color: Colors.grey.shade400,
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              //controller: userNameController,
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
                  Icons.lock_outlined,
                  color: Colors.grey.shade800,
                ),
                hintText: "Confirm New Password",
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
                onPressed: () async {}),
          ],
        ),
      ),
    );
  }
}
