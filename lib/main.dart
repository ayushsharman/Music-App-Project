// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_app/pages/emotion_detect.dart';
import 'package:music_app/pages/homepage.dart';
import 'package:music_app/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Music Recommendation App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Color.fromRGBO(19, 19, 19, 100),
      ),
      home: Routes(),
    );
  }
}
