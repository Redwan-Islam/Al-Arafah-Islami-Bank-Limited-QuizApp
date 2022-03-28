import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/Model/QuestionModelOne.dart';
import 'package:quiz/View/Screen/Material/Material.dart';
import 'package:quiz/View/Screen/QuizScreen/QuizScreen.dart';

class QuizMaterialScreen extends StatefulWidget {
  QuizMaterialScreen({Key? key}) : super(key: key);
  static const String routename = '/QuizMaterialScreen';

  @override
  State<QuizMaterialScreen> createState() => _QuizMaterialScreenState();
}

class _QuizMaterialScreenState extends State<QuizMaterialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Quiz Begin'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.person))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LottieBuilder.asset('assets/json/exam-blue.json'),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('questions')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final questionDocs = snapshot.data!.docs;
                final questions = questionDocs
                    .map((e) => Question.fromQueryDocumentSnapshot(e))
                    .toList();
                return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('config')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final configDoc = snapshot.data!.docs.first.data()
                        as Map<String, dynamic>;

                    final totalTime = configDoc['key'];

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Material(
                            color: Colors.redAccent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30.0)),
                            elevation: 5.0,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => QuizScreen(
                                            totalTime: totalTime,
                                            questions: questions)));
                              },
                              minWidth: 200.0,
                              child: const Text('Begin'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Material(
                            color: Colors.tealAccent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30.0)),
                            elevation: 5.0,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, MaterialAcess.routename);
                              },
                              minWidth: 200.0,
                              child: const Text('Material'),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
