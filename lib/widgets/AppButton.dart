import 'package:flutter/material.dart';

Widget appButton({
  required String buttonText,
  required void Function()? buttonAction,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      color: Colors.white,
      width: 200,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
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
