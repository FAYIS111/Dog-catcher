import 'package:dog_catcher/widgets/AppButton.dart';
import 'package:flutter/material.dart';

class HomePageCard extends StatelessWidget {
  final String buttonText;
  final void Function() buttonAction;
  const HomePageCard({
    super.key,
    required this.buttonText,
    required this.buttonAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Container(
        width: double.infinity,
        height: 70,
        color: Colors.white,
        child: Center(
          child: appButton(
            color: MaterialStateProperty.all(Colors.yellow),
            width: double.infinity,
            height: double.infinity,
            buttonText: buttonText,
            buttonAction: buttonAction,
          ),
        ),
      ),
    );
  }
}
