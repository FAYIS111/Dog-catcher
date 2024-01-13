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
import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> main() async {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white,
      ),
    ],
    debug: true,
  );
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
