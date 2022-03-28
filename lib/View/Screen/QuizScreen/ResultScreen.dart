import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz/Model/QuestionModelOne.dart';
import 'package:quiz/View/Screen/AssetsMaterial/ImageMaterial/image_preview.dart';
import 'package:quiz/View/Screen/AuthScreen/WelcomeScreen.dart';
import 'package:quiz/View/Screen/DashboardScreen/DashboardScreen.dart';

class ResultScreen extends StatefulWidget {
  static const String routename = '/ResultScreen';
  const ResultScreen({
    Key? key,
    required this.score,
    required this.questions,
  }) : super(key: key);

  final int score;
  final List<Question> questions;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Result: ${widget.score} / ${widget.questions.length}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 40,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () {
                      Navigator.pushNamed(context, DashboardScreen.routename);
                    },
                    child: const Text('DashBoard'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Image_preview()));
                    },
                    child: const Text('Show Answer'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.redAccent),
            onPressed: () {
              Navigator.pushNamed(context, WelcomeScreen.routename);
              // const path = 'assets/PDF/sample.pdf';
              // final file = await PDFApi.loadAsset(path);
              // openPDF(context, file);
            },
            child: const Text('Signout'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _updateHighscore();
  }

  Future<void> _updateHighscore() async {
    final authUser = FirebaseAuth.instance.currentUser;

    if (authUser == null) return;

    final userRef =
        FirebaseFirestore.instance.collection('users').doc(authUser.uid);

    final userDoc = await userRef.get();

    if (userDoc.exists) {
      final user = userDoc.data();

      if (user == null) return;

      final lastHighscore = user['score'];
      if (lastHighscore >= widget.score) {
        return;
      }

      userRef.update({'score': widget.score});
      return;
    }
    userRef.set({
      'email': authUser.email,
      'score': widget.score,
    });
  }
}

// void openPDF(BuildContext context, File file) {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//         builder: (context) => PDFViewerPage(
//               file: file,
//               key: null,
//             )),
//   );
// }
