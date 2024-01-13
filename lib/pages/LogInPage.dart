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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 30,
              ),
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
              AppTextField(
                labelText: "USER NAME/EMAIL",
                keyBoardType: TextInputType.name,
              ),
              SizedBox(
                height: 20,
              ),
              AppTextField(
                labelText: "PASSWORD",
                keyBoardType: TextInputType.number,
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
                  Navigator.pushNamed(context, '/HomePage');
                },
              ),
              appButton(
                width: 200,
                height: 50,
                color: MaterialStateProperty.all(Colors.greenAccent),
                buttonText: "SIGN UP",
                buttonAction: () {
                  Navigator.pushNamed(context, '/SignUp');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
