import 'package:dog_catcher/widgets/AppButton.dart';
import 'package:dog_catcher/widgets/Asset.dart';
import 'package:dog_catcher/widgets/TextField.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 350,
                child: Image.asset(
                  Logo3,
                  fit: BoxFit.cover,
                ),
              ),
              AppTextField(
                labelText: "EMAIL",
                keyBoardType: TextInputType.name,
              ),
              AppTextField(
                labelText: "PASSWORD",
                keyBoardType: TextInputType.number,
              ),
              appButton(
                buttonText: "SIGN UP",
                buttonAction: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
