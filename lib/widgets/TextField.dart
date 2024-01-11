import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String labelText;
  final TextInputType? keyBoardType;
  final int? maxLength;
  final int? maxLine;
  const AppTextField({
    Key? key,
    required this.labelText,
    this.maxLength,
    required this.keyBoardType,
    this.maxLine,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        maxLines: widget.maxLine,
        keyboardType: widget.keyBoardType,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.purple,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: widget.labelText,
        ),
      ),
    );
  }
}
