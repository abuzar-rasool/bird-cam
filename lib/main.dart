import 'dart:convert';
import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:bird_cam/bird.dart';
import 'package:bird_cam/database.dart';

void main() {
  runApp( BirdCam());
}

class BirdCam extends StatelessWidget {
  const BirdCam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BirdCam',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: "SF-Pro-Display"
      ),
      home: Scaffold(body:  Results()),
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
            builder: (context) =>  Results(),
          );
        }
);
  }
}

class Results extends StatelessWidget {
  // final Bird bird;
  Results({Key? key}) : super(key: key);
  Bird b = birds[0];
  final List<Map<String, dynamic>> _items = List.generate(
      5,
      (index) =>
          {"id": index, "title": "Item $index", "subtitle": "Subtitle $index"});

  final List<String> titles = ["Habitat", "Diet", "Lifespan", "Family", "Interesting Fact"];
  final List<IconData> leading_icons = [Icons.home_rounded, Icons.food_bank, Icons.health_and_safety, Icons.groups, Icons.favorite];

  Widget detailCard (
    {required Widget child,
    }) {
    return Container(
      width: double.infinity,
      height: 50,
      child: child,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1.0,
            blurRadius: 2.0
          )
        ]
      )
    ); 
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final List<String> b_details = [b.habitat, b.diet, b.lifespan, b.lifespan, b.other];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Container(
          alignment: Alignment.bottomLeft,
          decoration:  BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
              fit: BoxFit.cover,
              image:  AssetImage("assets/common_mynah.jpg",
          ),
            )
          ),
          height: screenHeight * 0.3,
          width: double.infinity,
          child:  Padding(
            padding: EdgeInsets.all(20.0),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(b.name,
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    ),
                ),
                Text(b.scientificName,
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                    )
                ),
              ],
            ),
          ),
        ),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 10.0),
          child: Text("Details", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400, color: Colors.black54)),
        ),
        //       SizedBox(height: 15),
          Expanded(
            child: ListTileTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          iconColor: Colors.red,
          textColor: Colors.brown.shade800,
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
          style: ListTileStyle.list,
          dense: true,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (_, index) => Card(
              color: Colors.white,
              elevation: 1.0,
              margin: EdgeInsets.symmetric(horizontal: 5.0, vertical:5.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.brown.shade700,
                  child: IconButton(
                          icon: Icon(leading_icons[index], color: Colors.white),
                          onPressed: () {},
                        ),
                ),
                title: Text(titles[index], 
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(b_details[index],
                style: TextStyle(fontSize: 16)),
              ),
            ),
          ),
          )
          )  
          ],
        );
  }
}




