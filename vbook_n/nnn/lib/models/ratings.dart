import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nnn/models/library.dart';

class Rate {
  String userID;
  String isbn;
  String bookRate;
  //UserLibrary userLibrary;
  Rate({
    required this.userID,
    required this.isbn,
    required this.bookRate,
    //required this.userLibrary
  });
}