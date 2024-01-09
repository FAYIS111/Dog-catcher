import 'package:dog_catcher/pages/CommonPage.dart';
import 'package:dog_catcher/pages/LogInPage.dart';
import 'package:dog_catcher/pages/ReportPage.dart';
import 'package:dog_catcher/pages/SignUpPage.dart';
import 'package:dog_catcher/pages/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/LogIn': (context) => LogInPage(),
        '/SignUp': (context) => SignUpPage(),
        '/HomePage': (context) => HomePage(),
        '/CommonPage': (context) => CommonPage(),
        '/ReportPage': (context) => ReportPage(),
      },
      initialRoute: '/LogIn',
      title: "Dog Catcher App",
      home: HomePage(),
    ),
  );
}
