import 'package:dog_catcher/pages/WrapperPage.dart';
import 'package:dog_catcher/widgets/AppButton.dart';
import 'package:dog_catcher/widgets/Asset.dart';
import 'package:dog_catcher/widgets/TextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      // If sign-up is successful, navigate to the Wrapper or next screen
      Get.offAll(Wrapper());
    } catch (e) {
      if (e is FirebaseAuthException) {
        // Handle specific Firebase Authentication exceptions here
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Sign Up Failed'),
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
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .4,
                child: Image.asset(
                  Logo3,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * .3,
                child: Column(
                  children: [
                    AppTextField(
                      textController: email,
                      labelText: "EMAIL",
                      keyBoardType: TextInputType.name,
                    ),
                    AppTextField(
                      textController: password,
                      labelText: "PASSWORD",
                      keyBoardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              appButton(
                width: 200,
                height: 50,
                color: MaterialStateProperty.all(Colors.greenAccent),
                buttonText: "SIGN UP",
                buttonAction: () {
                  setState(() {
                    signUp();
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
