import 'package:flutter/material.dart';

class QuestionWithAnswer {
  final String question;
  final List<String> answers;
  final String correctAnswer;

  QuestionWithAnswer({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}
