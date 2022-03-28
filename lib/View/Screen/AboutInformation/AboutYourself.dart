import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/Controller/showErrorMsg.dart';
import 'package:quiz/View/Screen/AuthScreen/WelcomeScreen.dart';

class AboutYourself extends StatefulWidget {
  AboutYourself({Key? key}) : super(key: key);
  static const String routename = '/AboutYourself';

  @override
  State<AboutYourself> createState() => _AboutYourselfState();
}

class _AboutYourselfState extends State<AboutYourself> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('About Yourself'),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              LottieBuilder.asset('assets/json/hello-orange.json'),
              const SizedBox(
                height: 25.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle_sharp),
                        hintText: 'Enter Your Name',
                        labelText: 'Enter Your Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ShowErrorMsg;
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.assignment_ind_rounded),
                        hintText: 'Enter Your ID',
                        labelText: 'Enter Your ID',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ShowErrorMsg;
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.app_registration_outlined),
                        hintText: 'Enter Your Designation',
                        labelText: 'Enter Your Designation',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ShowErrorMsg;
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_tree_outlined),
                        hintText: 'Enter Your Branch',
                        labelText: 'Enter Your Branch',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ShowErrorMsg;
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.desktop_windows),
                        hintText: 'Enter Your Present Working Desk',
                        labelText: 'Enter Your Present Working Desk',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ShowErrorMsg;
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.phone_android),
                        hintText: 'Enter Your Mobile Number',
                        labelText: 'Enter Your Mobile Number',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ShowErrorMsg;
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.redAccent),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // TODO submit
                          }
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
