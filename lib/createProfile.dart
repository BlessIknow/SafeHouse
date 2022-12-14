// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'dart:typed_data';

import 'package:safe_house_app/UserProfile.dart';

void main() {
  runApp(CreatProfile());
}

class CreatProfile extends StatelessWidget {
  const CreatProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: CreateProfileScreen(),
    );
  }
}

class CreateProfileScreen extends StatefulWidget {
  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  bool imageAvailable = false;

  late Uint8List imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Full Name",
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email Address",
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Short Bio",
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Location",
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Nationality",
                ),
              ),
              SizedBox(height: 20),
              Container(
                  height: 200,
                  width: 200,
                  color: Colors.grey,
                  child: imageAvailable
                      ? Image.memory(imageFile)
                      : const SizedBox()),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  final image = await ImagePickerWeb.getImageAsBytes();
                  setState(() {
                    imageFile = image!;
                    imageAvailable = true;
                  });
                },
                child: Container(
                  height: 50,
                  width: 150,
                  child: Center(
                    child: Text('Click here to Upload an Image'),
                  ),
                ),
              ),
              SizedBox(height: 20),
              MaterialButton(
                onPressed: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Userprofile()));
                }),
                child: Text("Create"),
                color: Colors.teal,
              )
            ],
          ),
        ),
      ),
    );
  }
}
