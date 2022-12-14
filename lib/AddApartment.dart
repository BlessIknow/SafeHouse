// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
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
//       home: AddApartment(),
//     );
//   }
// }

// class AddApartment extends StatefulWidget {
//   @override
//   State<AddApartment> createState() => _AddApartment();
// }

// class _AddApartment extends State<AddApartment> {
//   bool imageAvailable = false;

//   late Uint8List imageFile;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add Apartment"),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: "House Address",
//                 ),
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: "Apartment Type",
//                 ),
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: "Description",
//                 ),
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: "City",
//                 ),
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: "Country",
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
//                     child: Text('Upload Apartment Image'),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               MaterialButton(
//                 onPressed: (() {}),
//                 child: Text("Submit"),
//                 color: Colors.blue,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
