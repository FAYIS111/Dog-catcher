import 'package:flutter/material.dart';

Widget iconButton({
  required Icon buttonIcon,
  required void Function()? buttonAction,
}) {
  return IconButton(
    onPressed: buttonAction,
    icon: buttonIcon,
  );
}
