import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  List? _recognitions;

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      String? res = await Tflite.loadModel(
        model: "assets/tf_lite_model.tflite",
        labels: "assets/label.txt",
      );
      print(res);
    } catch (e) {
      print("Error loading model: $e");
    }
  }

  Future<void> _runModelOnImage(File image) async {
    try {
      final Uint8List imageBytes = await image.readAsBytes();
      var recognitions = await Tflite.runModelOnBinary(
        binary: imageBytes,
        numResults: 3,
      );
      setState(() {
        _recognitions = recognitions;
      });
      print("Result: $_recognitions");
    } catch (e) {
      print("Error running model: $e");
    }
  }

  Future<void> _takePicture() async {
    setState(() {
      _imageFile = null;
    });
    final XFile? imageFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      setState(() {
        _imageFile = imageFile;
      });
      await _runModelOnImage(File(_imageFile!.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Camera Screen'),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: _imageFile == null
                  ? const Text('No image selected')
                  : Image.file(File(_imageFile!.path)),
            ),
          ),
          if (_recognitions != null)
            Text(
              "Prediction: ${_recognitions![0]["label"]}",
              style: TextStyle(fontSize: 20),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        tooltip: 'Take Picture',
        child: const Icon(Icons.camera),
      ),
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
