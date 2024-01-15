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
      Get.offAll(const Wrapper());
      // Sign-in successful, navigate to the next screen or perform necessary actions.
    } catch (e) {
      if (e is FirebaseAuthException) {
        // Handle specific Firebase Authentication exceptions here
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Sign In Failed'),
              content: Text('${e.message}'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
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
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .4,
                  child: Image.asset(
                    Logo4,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * .3,
                child: Column(
                  children: [
                    AppTextField(
                      textController: email,
                      labelText: "USER NAME/EMAIL",
                      keyBoardType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                      textController: password,
                      labelText: "PASSWORD",
                      keyBoardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              const SizedBox(
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
                    Get.to(const SignUpPage());
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
