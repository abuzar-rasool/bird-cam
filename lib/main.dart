import 'dart:convert';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void main() {
  runApp(const BirdCam());
}

class BirdCam extends StatelessWidget {
  const BirdCam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: const Results()),
    );
  }
}

class HomeCamera extends StatefulWidget {
  const HomeCamera({Key? key}) : super(key: key);

  @override
  State<HomeCamera> createState() => _HomeCameraState();
}

class _HomeCameraState extends State<HomeCamera> {
  @override
  Widget build(BuildContext context) {
    return CameraCamera(
        onFile: (file) {
          showBarModalBottomSheet(
            context: context,
            builder: (context) => const Results(),
          );
        }
);
  }
}

class Results extends StatelessWidget {
  final Bird bird;
  const Results({Key? key, required this.bird}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Text(
            "Results",
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10,),
          Image.asset(
            "assets/bird.jpg",
            fit:BoxFit.cover,
            height: 300,
          ),
        ],
      ),
    );
  }
}

