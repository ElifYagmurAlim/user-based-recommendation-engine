import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecommendationFormScreen extends StatefulWidget {
  const RecommendationFormScreen({Key? key}) : super(key: key);

  @override
  _RecommendationFormScreenState createState() =>
      _RecommendationFormScreenState();
}

class _RecommendationFormScreenState extends State<RecommendationFormScreen> {
  String title = "Ghosts (The New York Trilogy #2)";
  Future getData(url) async {
    http.Response response = await http.get(Uri.parse(url));
    return response.body;
  }

  Future geaatData() async {
    var data = await getData('http://10.0.2.2:5000/jsondata?title=' + title);
    var decodedData = jsonDecode(data);
    print(decodedData['query']);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: () {
          geaatData();
        },
      ),
    );
  }
}
