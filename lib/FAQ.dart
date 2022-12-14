// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class Flashcard {
  final String question;
  final String answer;

  Flashcard({required this.question, required this.answer});
}

class FlashcardView extends StatelessWidget {
  final String text;

  FlashcardView({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal,
      elevation: 4,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

void main() {
  runApp(FAQ());
}

class FAQ extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<FAQ> {
  // ignore: prefer_final_fields
  List<Flashcard> _flashcards = [
    Flashcard(
        question: "Is SafeHouse safe?",
        answer:
            "The vast majority of SafeHouse experiences are not only safe, but outright life changing."),
    Flashcard(
        question: "Change my privacy settings?",
        answer: "You can review and update your privacy settings. "),
    Flashcard(
        question: "How do I report a problem?",
        answer:
            "We conduct all of our support in writing in order to keep a record of your experience and our response.")
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeHouse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("FAQ"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 50),
                child: Text(
                  "Frequency asked question.",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                  width: 250,
                  height: 250,
                  child: FlipCard(
                      front: FlashcardView(
                        text: _flashcards[_currentIndex].question,
                      ),
                      back: FlashcardView(
                        text: _flashcards[_currentIndex].answer,
                      ))),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton.icon(
                        onPressed: showPreviousCard,
                        icon: Icon(Icons.chevron_left),
                        label: Text('Prev')),
                    OutlinedButton.icon(
                        onPressed: showNextCard,
                        icon: Icon(Icons.chevron_right),
                        label: Text('Next')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }
}
