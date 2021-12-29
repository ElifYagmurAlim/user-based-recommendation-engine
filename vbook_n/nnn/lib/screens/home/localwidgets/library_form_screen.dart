import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nnn/services/database.dart';

class LibraryFormScreen extends StatefulWidget {
    const LibraryFormScreen({Key? key}) : super(key: key);

    @override
    _LibraryFormScreenState createState() => _LibraryFormScreenState();
}

class _LibraryFormScreenState extends State<LibraryFormScreen> {
    final Stream<QuerySnapshot> books = FirebaseFirestore.instance.collection('library').snapshots();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    @override
    Widget build(BuildContext context) {
        return Container(
            height: 250,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: StreamBuilder<QuerySnapshot>(
                stream: books,
                builder: (
                    BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot,
                    ){
                    if(snapshot.hasError){
                        return Text('Error');

                    }
                    if(snapshot.connectionState == ConnectionState.waiting){
                        return Text('Loading');
                    }
                    final data = snapshot.requireData;
                    return ListView.builder(
                        itemCount: data.size    ,
                        itemBuilder: (context,index){
                            if("${data.docs[index]['userID']}"==_auth.currentUser!.uid){
                                return Text("Title ${data.docs[index]['bookTitle']}");
                            }
                            else{
                                return Text("sdfghjk");
                            }

                        },);
            },),

        );
    }
}

