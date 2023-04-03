import "package:flutter/material.dart";
// import 'package:iconsax/iconsax.dart';

class EmotionDetection extends StatefulWidget {
  const EmotionDetection({super.key});

  @override
  State<EmotionDetection> createState() => _EmotionDetectionState();
}

class _EmotionDetectionState extends State<EmotionDetection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: const Text("Hello"),
    );
  }
}
