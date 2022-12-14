// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'login.dart';

// void main() => runApp(Welcome());

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Welcome"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                " Welcome to",
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
              Image.network(
                'https://i.postimg.cc/nr61FCLD/Safe-House-logo-Trans.png',
              ),
              // Text(
              //   "Safe House",
              //   style: TextStyle(
              //     fontSize: 35,
              //   ),
              // ),
              Text(
                " Find a home anywhere you go.",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.teal,
              //     // minimumSize: const Size.fromHeight(20), // NEW
              //   ),
              //   onPressed: () => {
              //     Navigator.push(
              //         context, MaterialPageRoute(builder: (context) => Login()))
              //   },
              //   child: const Text(
              //     'Check in',
              //     style: TextStyle(fontSize: 20),
              //   ),
              // ),
              OutlinedButton.icon(
                onPressed: () => {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Login()))
                },
                label: Text('Check In'),
                icon: Icon(Icons.chevron_right),
                // ButtonStyle (backgroundColor: Color.fromARGB(23, 2, 2, 2))
              ),
            ],
          ),
        ),
      ),
    );
  }
}
