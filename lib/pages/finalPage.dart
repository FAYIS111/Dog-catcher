import 'package:dog_catcher/widgets/AppButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dog_catcher/pages/LogInPage.dart';
import 'package:get/get.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key});

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.offAll(const LogInPage());
      // Redirect to the login page or perform any necessary actions after sign-out.
    } catch (e) {
      // Handle sign-out errors here
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Column(
                children: [
                  Text('THANKS FOR'),
                  Text(
                    'your submission',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 150,
              ),
              appButton(
                color: MaterialStateProperty.all(Colors.greenAccent),
                width: 150,
                height: 50,
                buttonText: "SIGN OUT",
                buttonAction: () {
                  signOut();
                },
              ),
              appButton(
                color: MaterialStateProperty.all(Colors.greenAccent),
                width: 150,
                height: 100,
                buttonText: 'ADMIN PANAL',
                buttonAction: () {
                  Navigator.pushNamed(context, '/CartPage');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
