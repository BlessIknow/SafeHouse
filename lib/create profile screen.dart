// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_application_1/user%20profile.dart';
// import 'package:image_picker_web/image_picker_web.dart';
// import 'dart:typed_data';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CreateProfileScreen(),
//     );
//   }
// }

// class CreateProfileScreen extends StatefulWidget {
//   @override
//   State<CreateProfileScreen> createState() => _CreateProfileScreenState();
// }

// class _CreateProfileScreenState extends State<CreateProfileScreen> {
//   bool imageAvailable = false;

//   late Uint8List imageFile;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Create Profile"),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: "Full Name",
//                 ),
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: "Email Address",
//                 ),
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: "Short Bio",
//                 ),
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: "Location",
//                 ),
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: "Nationality",
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                   height: 200,
//                   width: 200,
//                   color: Colors.white,
//                   child: imageAvailable
//                       ? Image.memory(imageFile)
//                       : const SizedBox()),
//               SizedBox(height: 20),
//               GestureDetector(
//                 onTap: () async {
//                   final image = await ImagePickerWeb.getImageAsBytes();
//                   setState(() {
//                     imageFile = image!;
//                     imageAvailable = true;
//                   });
//                 },
//                 child: Container(
//                   height: 50,
//                   width: 150,
//                   child: Center(
//                     child: Text('Upload Image'),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               MaterialButton(
//                 onPressed: (() {}),
//                 child: Text("Create"),
//                 color: Colors.blue,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
