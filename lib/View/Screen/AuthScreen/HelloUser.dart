import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/View/Screen/AuthScreen/WelcomeScreen.dart';

class HelloUser extends StatefulWidget {
  HelloUser({Key? key}) : super(key: key);
  static const String routename = '/HelloUser';

  @override
  State<HelloUser> createState() => _HelloUserState();
}

class _HelloUserState extends State<HelloUser> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Welcome User'),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: Center(
        child: Column(
          children: [
            LottieBuilder.asset('assets/json/hello-orange.json'),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              'Hello',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              user.email!,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
