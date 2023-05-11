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
  List<dynamic>? _recognitions;

  @override
  void initState() {
    super.initState();
    // Load the TensorFlow Lite model on initialization
    loadModel();
  }

  // Load the TensorFlow Lite model
  Future<void> loadModel() async {
    try {
      String? result = await Tflite.loadModel(
        model: 'tf_lite_model.tflite',
        labels: 'assets/labels.txt',
      );
      print('Model loaded successfully: $result');
    } catch (e) {
      print('Failed to load model: $e');
    }
  }

  Future<Uint8List> imageToByteList(XFile image) async {
    final bytes = await image.readAsBytes();
    return Uint8List.fromList(bytes);
  }

// Run inference on the selected image using the loaded TensorFlow Lite model
  Future<void> runInference() async {
    if (_imageFile == null) return;

    // Create a ByteData object from the selected image
    final bytes = await _imageFile!.readAsBytes();
    final image = MemoryImage(bytes);

    // Run inference on the image using the TensorFlow Lite model
    final Uint8List bytesList = await imageToByteList(_imageFile!);
    final List<dynamic>? recognitions =
        await Tflite.runModelOnBinary(binary: bytesList);
    setState(() {
      _recognitions = recognitions;
    });
  }

  Future<void> _takePicture() async {
    setState(() {
      _imageFile = null;
      _recognitions = null;
    });
    final XFile? imageFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      setState(() {
        _imageFile = imageFile;
      });
      // Run inference on the selected image
      await runInference();
    }
  }

  @override
  void dispose() {
    // Release the loaded TensorFlow Lite model on disposal
    Tflite.close();
    super.dispose();
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_imageFile == null)
              const Text('No image selected')
            else
              Image.file(File(_imageFile!.path)),
            if (_recognitions != null && _recognitions!.isNotEmpty)
              const SizedBox(height: 16),
            if (_recognitions != null && _recognitions!.isNotEmpty)
              Text('Emotion detected: ${_recognitions![0]['label']}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        tooltip: 'Take Picture',
        child: const Icon(Icons.camera),
      ),
    );
  }
}
