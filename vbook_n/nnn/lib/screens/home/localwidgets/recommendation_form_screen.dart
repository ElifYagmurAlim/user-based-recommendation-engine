import 'package:flutter/material.dart';
import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';

class RecommendationFormScreen extends StatefulWidget {
  const RecommendationFormScreen({Key? key}) : super(key: key);

  @override
  _RecommendationFormScreenState createState() =>
      _RecommendationFormScreenState();
}

class _RecommendationFormScreenState extends State<RecommendationFormScreen> {
  FirebaseModelDownloader downloader = FirebaseModelDownloader.instance;

  dara() async {
    FirebaseCustomModel model = await FirebaseModelDownloader.instance
        .getModel('example_model', FirebaseModelDownloadType.latestModel);

    print('Name: ${model.name}');
    print('Size: ${model.size}');
    print('Hash: ${model.hash}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: () {
          dara();
        },
      ),
    );
  }
}
