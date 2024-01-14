import 'package:dog_catcher/pages/SignUpPage.dart';
import 'package:dog_catcher/widgets/AppButton.dart';
import 'package:dog_catcher/widgets/Asset.dart';
import 'package:dog_catcher/widgets/TextField.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:dog_catcher/pages/WrapperPage.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<void> logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Get.offAll(Wrapper());
      // Sign-in successful, navigate to the next screen or perform necessary actions.
    } catch (e) {
      if (e is FirebaseAuthException) {
        // Handle specific Firebase Authentication exceptions here
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Sign In Failed'),
              content: Text('${e.message}'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Handle other exceptions here
        print('Error occurred: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 350,
                  child: Image.asset(
                    Logo4,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  AppTextField(
                    textController: email,
                    labelText: "USER NAME/EMAIL",
                    keyBoardType: TextInputType.name,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    textController: password,
                    labelText: "PASSWORD",
                    keyBoardType: TextInputType.number,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              appButton(
                width: 200,
                height: 50,
                color: MaterialStateProperty.all(Colors.greenAccent),
                buttonText: "LOG IN",
                buttonAction: () {
                  logIn();
                },
              ),
              appButton(
                width: 200,
                height: 50,
                color: MaterialStateProperty.all(Colors.greenAccent),
                buttonText: "SIGN UP",
                buttonAction: () {
                  setState(() {
                    Get.to(SignUpPage());
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
