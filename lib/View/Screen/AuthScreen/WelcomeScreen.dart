import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quiz/View/Screen/Adminastration/WelcomeAdmin.dart';
import 'package:quiz/View/Screen/AuthScreen/LoginScreen.dart';
import 'package:quiz/View/Screen/AuthScreen/SigninScreen.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  static const String routename = '/WelcomeScreen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Welcome Screen'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, WelcomeAdmin.routename);
                },
                icon: const Icon(Icons.android)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 64.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/logo.png'),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.greenAccent,
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SigninScreen.routename);
                    },
                    minWidth: 200.0,
                    child: const Text('Sign Up'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.blueAccent,
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.routename);
                    },
                    minWidth: 200.0,
                    child: const Text('Log in'),
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Or sign in with'),
                    TextButton(
                      style: TextButton.styleFrom(primary: Colors.green),
                      onPressed: () {},
                      child: const Text('Google'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const DrawerWidget(),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Image.asset('assets/images/mosque3.jpg'),
          const SizedBox(
            height: 20,
          ),
          const ListTile(
            title: Text('Organization Name'),
            subtitle: Text('Al-Arafah Islami Bank'),
            trailing: Icon(Icons.person),
          ),
          const ListTile(
            title: Text('Organization Email'),
            subtitle: Text('www.aibl.com.bd'),
            trailing: Icon(Icons.email),
          ),
        ],
      ),
    );
  }
}
