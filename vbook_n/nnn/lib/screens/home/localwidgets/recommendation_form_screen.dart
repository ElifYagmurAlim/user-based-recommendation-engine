import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
import 'package:flutter/services.dart';
import 'package:mlkit/mlkit.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class RecommendationFormScreen extends StatefulWidget {
  const RecommendationFormScreen({Key? key}) : super(key: key);

  @override
  _RecommendationFormScreenState createState() =>
      _RecommendationFormScreenState();
}

class _RecommendationFormScreenState extends State<RecommendationFormScreen> {
  FirebaseModelDownloader downloader = FirebaseModelDownloader.instance;
  FirebaseModelInterpreter interpreter = FirebaseModelInterpreter.instance;
  FirebaseModelManager manager = FirebaseModelManager.instance;

  dara() async {
    var convertedBytes = new Uint8List(1);
    var buffer = new ByteData.view(convertedBytes.buffer);
    manager.registerRemoteModelSource(
        FirebaseRemoteModelSource(modelName: "example_model"));
    manager.registerLocalModelSource(FirebaseLocalModelSource(
        modelName: 'firebase_ml_model',
        assetFilePath: 'assets/model/firebase_ml_model.tflite'));
    var results = await interpreter.run(
        remoteModelName: "example_model",
        localModelName: "firebase_ml_model",
        inputOutputOptions: FirebaseModelInputOutputOptions([
          FirebaseModelIOOption(FirebaseModelDataType.FLOAT32, [1, 1])
        ], [
          FirebaseModelIOOption(FirebaseModelDataType.FLOAT32, [1, 1])
        ]),
        inputBytes: convertedBytes);
    // FirebaseCustomModel model = await FirebaseModelDownloader.instance
    //     .getModel('example_model', FirebaseModelDownloadType.latestModel);
    print(results);
    // print('Name: ${model.name}');
    // print('Size: ${model.size}');
    // print('Hash: ${model.hash}');
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
