import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz/Model/QuestionModelOne.dart';
import 'package:quiz/View/Screen/AuthScreen/WelcomeScreen.dart';

import 'ResultScreen.dart';

class QuizScreen extends StatefulWidget {
  static const String routename = '/QuizScreen';
  const QuizScreen({
    Key? key,
    required this.totalTime,
    required this.questions,
  }) : super(key: key);

  final int totalTime;
  final List<Question> questions;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late int _currentTime;
  late Timer _timer;
  int _currentIndex = 0;
  String _selectedAnswer = '';
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _currentTime = widget.totalTime;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime -= 1;
      });
      if (_currentTime == 0) {
        _timer.cancel();
        pushResultScreen(context);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[_currentIndex];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('TestBegin'),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    LinearProgressIndicator(
                      value: _currentTime / widget.totalTime,
                    ),
                    Center(
                      child: Text(
                        _currentTime.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Question',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              currentQuestion.question,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final answer = currentQuestion.answers[index];
                  return AnswerTile(
                    isSelected: answer == _selectedAnswer,
                    answer: answer,
                    correctAnswer: currentQuestion.correctAnswer,
                    onTap: () {
                      setState(() {
                        _selectedAnswer = answer;
                      });

                      if (answer == currentQuestion.correctAnswer) {
                        _score++;
                      }

                      Future.delayed(const Duration(milliseconds: 200), () {
                        if (_currentIndex == widget.questions.length - 1) {
                          pushResultScreen(context);
                          return;
                        }
                        setState(() {
                          _currentIndex++;
                          _selectedAnswer = '';
                        });
                      });
                    },
                  );
                },
                itemCount: currentQuestion.answers.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  void pushResultScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>
            ResultScreen(score: _score, questions: widget.questions),
      ),
    );
  }
}

class AnswerTile extends StatelessWidget {
  const AnswerTile({
    Key? key,
    required this.isSelected,
    required this.answer,
    required this.correctAnswer,
    required this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final String answer;
  final String correctAnswer;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: ListTile(
        onTap: () => onTap(),
        title: Text(
          answer,
          style: TextStyle(
            fontSize: 18,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Color get cardColor {
    if (!isSelected) return Colors.white;

    if (answer == correctAnswer) {
      return Colors.teal;
    }

    return Colors.redAccent;
  }
}
