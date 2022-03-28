import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/View/Screen/Adminastration/AdminLogin.dart';
import 'package:quiz/View/Screen/AuthScreen/WelcomeScreen.dart';

class WelcomeAdmin extends StatefulWidget {
  WelcomeAdmin({Key? key}) : super(key: key);
  static const String routename = '/WelcomeAdminScreen';

  @override
  State<WelcomeAdmin> createState() => _WelcomeAdminState();
}

class _WelcomeAdminState extends State<WelcomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Admin Space'),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LottieBuilder.asset('assets/json/admin.json'),
          ),
          const SizedBox(
            height: 32.0,
          ),
          const Text(
            'Are You an Admin?',
            style: TextStyle(fontSize: 20, letterSpacing: 2),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.greenAccent),
                      onPressed: () {
                        Navigator.pushNamed(context, AdminLogin.routename);
                      },
                      child: const Text('Yes')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.redAccent),
                      onPressed: () {
                        Navigator.popAndPushNamed(
                            context, WelcomeScreen.routename);
                      },
                      child: const Text('No')),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
