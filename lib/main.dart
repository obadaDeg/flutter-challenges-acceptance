import 'package:flutter/material.dart';
import 'package:flutter_challenges_acceptance/views/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}
