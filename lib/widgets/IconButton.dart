import 'package:flutter/material.dart';

Widget iconButton({
  required Icon buttonIcon,
  required void Function()? buttonAction,
}) {
  return IconButton(
    onPressed: buttonAction,
    icon: buttonIcon,
    style: ButtonStyle(
      iconColor: MaterialStateProperty.all(Colors.purple),
      backgroundColor: MaterialStateProperty.all(Colors.purple),
    ),
  );
}
