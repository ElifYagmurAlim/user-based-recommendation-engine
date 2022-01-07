import 'package:flutter/material.dart';
import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

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
    final interpreter =
        await tfl.Interpreter.fromAsset('firebase_ml_model.tflite');
    print('Interpreter loaded successfully');
    // For ex: if input tensor shape [1,5] and type is float32
    var input = [
      [1.0],
      [1.0]
    ];

    // if output tensor shape [1,2] and type is float32
    var output = List.filled(1 * 1, 0).reshape([1, 1]);

    // inference
    interpreter.run(input, output);

    // print the output
    print(output);
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
