import 'package:flutter/material.dart';

class CommonPageCard extends StatefulWidget {
  final String cardText;
  final String cardImage;
  final BoxFit? fit;
  void Function()? clickAction;
  CommonPageCard({
    Key? key,
    required this.cardText,
    required this.cardImage,
    this.fit,
    required this.clickAction,
  }) : super(key: key);

  @override
  State<CommonPageCard> createState() => _CommonPageCardState();
}

class _CommonPageCardState extends State<CommonPageCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: widget.clickAction,
        child: Card(
          shadowColor: Colors.grey,
          elevation: 12,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: [
                      Text("Click Here"),
                      Text(
                        widget.cardText,
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 700,
                color: Colors.yellow,
                child: Image.asset(
                  widget.cardImage,
                  fit: widget.fit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
