import 'package:dog_catcher/pages/AdminPanal.dart';
import 'package:dog_catcher/pages/CommonPage.dart';
import 'package:dog_catcher/pages/LocationPage.dart';
import 'package:dog_catcher/pages/LogInPage.dart';
import 'package:dog_catcher/pages/NormalDogGallary.dart';
import 'package:dog_catcher/pages/ReportPage.dart';
import 'package:dog_catcher/pages/SignUpPage.dart';
import 'package:dog_catcher/pages/StrayDogGallary.dart';
import 'package:dog_catcher/pages/WrapperPage.dart';
import 'package:dog_catcher/pages/finalPage.dart';
import 'package:dog_catcher/pages/homePage.dart';
import 'package:dog_catcher/pages/instructionPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
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
    GetMaterialApp(
      routes: {
        '/LogIn': (context) => const LogInPage(),
        '/SignUp': (context) => const SignUpPage(),
        '/HomePage': (context) => const HomePage(),
        '/CommonPage': (context) => const CommonPage(),
        '/ReportPage': (context) => const ReportPage(),
        '/LocationPage': (context) => const LocationPage(),
        '/FinalPage': (context) => const FinalPage(),
        '/StrayDog': (context) => const StrayDogGallary(),
        '/NormalDog': (context) => const NormalDogGallary(),
        '/AdminPanal': (context) => const AdminPanel(),
        '/Instruction': (context) => const InstructionPage(),
      },
      initialRoute: '/LogIn',
      title: "Dog Catcher App",
      home: const Wrapper(),
    ),
  );
}
