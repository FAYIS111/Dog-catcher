import 'package:dog_catcher/pages/CommonPage.dart';
import 'package:dog_catcher/pages/LocationPage.dart';
import 'package:dog_catcher/pages/LogInPage.dart';
import 'package:dog_catcher/pages/ReportPage.dart';
import 'package:dog_catcher/pages/SignUpPage.dart';
import 'package:dog_catcher/pages/finalPage.dart';
import 'package:dog_catcher/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      routes: {
        '/LogIn': (context) => LogInPage(),
        '/SignUp': (context) => SignUpPage(),
        '/HomePage': (context) => HomePage(),
        '/CommonPage': (context) => CommonPage(),
        '/ReportPage': (context) => ReportPage(),
        '/LocationPage': (context) => LocationPage(),
        '/FinalPage': (context) => FinalPage(),
      },
      initialRoute: '/LogIn',
      title: "Dog Catcher App",
      home: HomePage(),
    ),
  );
}
