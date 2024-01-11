import 'package:flutter/material.dart';

Widget appButton({
  required String buttonText,
  required void Function()? buttonAction,
  MaterialStateProperty<Color?>? color,
  double? width,
  double? height,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      color: Colors.grey.shade300,
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all(Colors.grey),
          elevation: MaterialStateProperty.all(15),
          backgroundColor: color,
        ),
        onPressed: buttonAction,
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
