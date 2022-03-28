import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz/View/Screen/AboutInformation/AboutYourself.dart';
import 'package:quiz/View/Screen/Adminastration/AddPeople/AddPeople.dart';
import 'package:quiz/View/Screen/Adminastration/AdminDashboard.dart';
import 'package:quiz/View/Screen/Adminastration/AdminLogin.dart';
import 'package:quiz/View/Screen/Adminastration/SendEmail/SendEmail.dart';
import 'package:quiz/View/Screen/Adminastration/WelcomeAdmin.dart';
import 'package:quiz/View/Screen/AssetsMaterial/VideosMaterial/VideoAssetPlayer.dart';
import 'package:quiz/View/Screen/AuthScreen/HelloUser.dart';
import 'package:quiz/View/Screen/AuthScreen/LoginScreen.dart';
import 'package:quiz/View/Screen/AuthScreen/SigninScreen.dart';
import 'package:quiz/View/Screen/AuthScreen/WelcomeScreen.dart';
import 'package:quiz/View/Screen/DashboardScreen/DashboardScreen.dart';
import 'package:quiz/View/Screen/DashboardScreen/QuizMaterialScreen.dart';
import 'package:quiz/View/Screen/Material/Material.dart';
import 'View/Screen/SplashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      home: SplashScreen(),
      routes: {
        SigninScreen.routename: (context) => SigninScreen(),
        LoginScreen.routename: (context) => LoginScreen(),
        WelcomeScreen.routename: (context) => WelcomeScreen(),
        DashboardScreen.routename: (context) => DashboardScreen(),
        QuizMaterialScreen.routename: (context) => QuizMaterialScreen(),
        WelcomeAdmin.routename: (context) => WelcomeAdmin(),
        AdminLogin.routename: (context) => AdminLogin(),
        AdminDashboard.routename: (context) => AdminDashboard(),
        AddPeople.routename: (context) => AddPeople(),
        SendEmail.routename: (context) => SendEmail(),
        MaterialAcess.routename: (context) => MaterialAcess(),
        AboutYourself.routename: (context) => AboutYourself(),
        HelloUser.routename: (context) => HelloUser(),
        VideoAssetPlayer.routename: (context) => VideoAssetPlayer(),
      },
    );
  }
}
