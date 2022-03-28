import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quiz/Controller/DashcardDesign.dart';
import 'package:quiz/View/Screen/AboutInformation/AboutYourself.dart';
import 'package:quiz/View/Screen/AuthScreen/HelloUser.dart';
import 'package:quiz/View/Screen/AuthScreen/WelcomeScreen.dart';
import 'package:quiz/View/Screen/DashboardScreen/QuizMaterialScreen.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);
  static const String routename = '/DashboardScreen';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('My Dashboard'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, HelloUser.routename);
              },
              icon: const Icon(Icons.person))
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
              child: DashboardGridview(),
            ),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, AboutYourself.routename);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Image.asset(
          'assets/images/mosque1.jpg',
        ),
        Image.asset(
          'assets/images/mosque2.jpg',
        ),
        Image.asset(
          'assets/images/mosque3.jpg',
        ),
      ],
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }
}

class DashboardGridview extends StatelessWidget {
  const DashboardGridview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 3,
      mainAxisSpacing: 3,
      children: [
        DashcardDesign(
          text: 'HTML',
          image: 'assets/icons/html-file.png',
          onPressed: () {
            Navigator.pushNamed(context, QuizMaterialScreen.routename);
          },
        ),
        DashcardDesign(
          text: 'CSS',
          image: 'assets/icons/css.png',
          onPressed: () {
            Navigator.pushNamed(context, QuizMaterialScreen.routename);
          },
        ),
        DashcardDesign(
          text: 'JAVA',
          image: 'assets/icons/file.png',
          onPressed: () {
            Navigator.pushNamed(context, QuizMaterialScreen.routename);
          },
        ),
        DashcardDesign(
          text: 'JS',
          image: 'assets/icons/javascript.png',
          onPressed: () {
            Navigator.pushNamed(context, QuizMaterialScreen.routename);
          },
        ),
        DashcardDesign(
          text: 'Python',
          image: 'assets/icons/python.png',
          onPressed: () {
            Navigator.pushNamed(context, QuizMaterialScreen.routename);
          },
        ),
        DashcardDesign(
          text: 'Data',
          image: 'assets/icons/school-material.png',
          onPressed: () {
            Navigator.pushNamed(context, QuizMaterialScreen.routename);
          },
        ),
      ],
    );
  }
}
