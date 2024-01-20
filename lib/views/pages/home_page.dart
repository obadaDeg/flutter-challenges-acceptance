import 'package:flutter/material.dart';
import 'package:flutter_challenges_acceptance/units/questions_with_answers.dart';
import 'package:flutter_challenges_acceptance/views/widgets/select_opstion.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int questionIndex = 0;
  int score = 0;
  bool showResultsMessage = false;
  int? yourChoiceIndex;

  List<Widget> congrats = [
    const Text(
      'Congratulations!',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(width: 8.0),
    const Icon(
      Icons.emoji_events,
      color: Colors.yellow,
      size: 30,
    ),
  ];

  List<Widget> tryAgain = [
    const Text(
      'Try Again!',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(width: 8.0),
    const Icon(
      Icons.cancel,
      color: Colors.red,
      size: 30,
    ),
  ];

  List<QuestionWithAnswer> questionsWithAnswers = [
    QuestionWithAnswer(
      question: 'What is your favorite sport?',
      answers: ['Football', 'Tennis', 'Basketball', 'Volleyball'],
      correctAnswer: 'Football',
    ),
    QuestionWithAnswer(
      question: 'What is your favorite color?',
      answers: ['Green', 'Red', 'Blue', 'White'],
      correctAnswer: 'Red',
    ),
    QuestionWithAnswer(
      question: 'What is your favorite animal?',
      answers: ['Camel', 'Horse', 'Dog', 'Cat'],
      correctAnswer: 'Dog',
    ),
    QuestionWithAnswer(
      question: 'What is your favorite animal?',
      answers: ['Camel', 'Horse', 'Dog', 'Cat'],
      correctAnswer: 'Dog',
    ),
  ];

  void showAnswers() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Answers'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < questionsWithAnswers.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      questionsWithAnswers[i].question,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      questionsWithAnswers[i].correctAnswer,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void checkAnswer() {
    if (yourChoiceIndex != null &&
        questionsWithAnswers[questionIndex].answers[yourChoiceIndex!] ==
            questionsWithAnswers[questionIndex].correctAnswer) {
      setState(() {
        score++;
      });
    }
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      showResultsMessage = false;
      yourChoiceIndex = null;
      score = 0;
    });
  }

  void nextQuestion() {
    setState(() {
      if (yourChoiceIndex != null) {
        checkAnswer();

        if (questionIndex < questionsWithAnswers.length - 1) {
          questionIndex++;
        } else {
          showResultsMessage = true;
        }
        yourChoiceIndex = null;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Please select an option before moving to the next question.',
            ),
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final questionWithAnswer = questionsWithAnswers[questionIndex];
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 4000),
            child: !showResultsMessage
                ? buildQuestionPage(questionWithAnswer, size)
                : buildCongratsPage(),
          ),
        ),
      ),
    );
  }

  Widget buildQuestionPage(QuestionWithAnswer questionWithAnswer, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.1),
        Text(
          questionWithAnswer.question,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16.0),
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 8.0,
            ),
            child: Row(
              children: [
                Text(
                  'Question ${questionIndex + 1}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Text(
                  ' of ${questionsWithAnswers.length}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: size.height * 0.1),
        for (int i = 0; i < questionWithAnswer.answers.length; i++)
          AnswerOption(
            answer: questionWithAnswer.answers[i],
            isSelected: i == yourChoiceIndex,
            onTap: () {
              setState(() {
                yourChoiceIndex = i;
              });
            },
          ),
        const Spacer(),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCongratsPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: (score > questionsWithAnswers.length / 3)
              ? [
                  const Text(
                    'Congratulations!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Icon(
                    Icons.emoji_events,
                    color: Colors.yellow,
                    size: 30,
                  ),
                ]
              : [
                  const Text(
                    'Try again!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Icon(
                    Icons.sentiment_dissatisfied,
                    color: Colors.red,
                    size: 30,
                  ),
                ],
        ),
        const SizedBox(height: 8.0),
        Text(
          'Your score is: $score/${questionsWithAnswers.length}',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: showAnswers,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text('Show Answers'),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: resetQuiz,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text('Reset Quiz'),
          ),
        ),
      ],
    );
  }
}
