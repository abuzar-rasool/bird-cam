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
  // final Bird bird;
  const Results({Key? key}) : super(key: key);
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

// Common Mynah:
// •	Looks: A large, black-and-brown myna with white wing patches, yellow bill, and yellow legs.
// •	Aggressive, often driving away other birds.
// •	Mostly found on dense forest.
// •	Native to southern Asia.
// •	Family: Sturnidae
// •	Life span: 4 years
// House Sparrow:

// •	Looks:  Males have smart black bibs, bright rufous napes, and stunningly patterned wings with brilliant buffs and browns.
// •	Widespread and abundant in cities, neighborhoods and farms
// •	Avoids dense forest.
// •	Native to Eurasia.
// •	Scientific name: Passer domesticus
// •	Lifespan: 3 years (In the wild)
// •	Aggressive for nesting sites.

// House Crow:
// •	Looks: A slender, blackish medium-sized crow with a long bill. 
// •	feeding on leftover rubbish from humans
// •	Found in a wide range of habitats mostly around human habitation.
// •	Their call is a loud and harsh “kaa kaa kaa.”
// •	Scientific name: Corvus splendens
// •	Crows can be found all over the world in a variety of habitats. 
// •	Lifespan: 13 years in the wild 

// class Bird {
//   final int id;
//   final String name;
//   final String image;

// }