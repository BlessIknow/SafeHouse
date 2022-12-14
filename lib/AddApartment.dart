// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'dart:typed_data';
import 'UserProfile.dart';

// void main() {
//   runApp(AddAppartment());
// }

class AddAppartment extends StatelessWidget {
  const AddAppartment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: AddApartment(),
    );
  }
}

class AddApartment extends StatefulWidget {
  @override
  State<AddApartment> createState() => _AddApartment();
}

class _AddApartment extends State<AddApartment> {
  bool imageAvailable = false;

  late Uint8List imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Apartment"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(150, 20, 150, 20),
          child: Column(
            children: [
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
                    child: Text('Click here Upload Apartment Image'),
                  ),
                ),
              ),
              Center(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "House Address",
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Apartment Type",
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Description",
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "City",
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Country",
                ),
              ),
              SizedBox(height: 20),
              MaterialButton(
                onPressed: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Userprofile()));
                }),
                child: Text("Submit"),
                color: Colors.teal,
              )
            ],
          ),
        ),
      ),
    );
  }
}
