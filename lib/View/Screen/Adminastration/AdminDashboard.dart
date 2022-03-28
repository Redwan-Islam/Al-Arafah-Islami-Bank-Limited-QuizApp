import 'package:flutter/material.dart';
import 'package:quiz/Controller/DashcardDesign.dart';
import 'package:quiz/View/Screen/Adminastration/AddPeople/AddPeople.dart';
import 'package:quiz/View/Screen/Adminastration/SendEmail/SendEmail.dart';
import 'package:quiz/View/Screen/AuthScreen/WelcomeScreen.dart';
import 'package:quiz/View/Screen/DashboardScreen/DashboardScreen.dart';

class AdminDashboard extends StatefulWidget {
  AdminDashboard({Key? key}) : super(key: key);
  static const String routename = '/AdminDashboard';

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Hello Admin'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, WelcomeScreen.routename);
                },
                icon: const Icon(Icons.logout_outlined)),
          )
        ],
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 32.0,
          ),
          CarouselSliderWidget(),
          SizedBox(
            height: 32.0,
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: AdminDashboardGridview(),
            ),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
    );
  }
}

class AdminDashboardGridview extends StatelessWidget {
  const AdminDashboardGridview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      children: [
        DashcardDesign(
          text: 'Add',
          image: 'assets/icons/man.png',
          onPressed: () {
            Navigator.pushNamed(context, AddPeople.routename);
          },
        ),
        DashcardDesign(
            text: 'Email',
            image: 'assets/icons/message.png',
            onPressed: () {
              Navigator.pushNamed(context, SendEmail.routename);
            }),
        DashcardDesign(
          text: 'EXT',
          image: 'assets/icons/customer-service.png',
          onPressed: () {},
        ),
        DashcardDesign(
          text: 'EXT',
          image: 'assets/icons/customer-service.png',
          onPressed: () {},
        ),
      ],
    );
  }
}
