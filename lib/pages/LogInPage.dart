import 'package:dog_catcher/widgets/AppButton.dart';
import 'package:dog_catcher/widgets/Asset.dart';
import 'package:dog_catcher/widgets/TextField.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
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
                height: 350,
                child: Image.asset(
                  Logo4,
                  fit: BoxFit.cover,
                ),
              ),
              AppTextField(
                labelText: "USER NAME/EMAIL",
                keyBoardType: TextInputType.name,
              ),
              AppTextField(
                labelText: "PASSWORD",
                keyBoardType: TextInputType.number,
              ),
              appButton(buttonText: "LOG IN"),
              appButton(buttonText: "SIGN UP"),
            ],
          ),
        ),
      ),
    );
  }
}
