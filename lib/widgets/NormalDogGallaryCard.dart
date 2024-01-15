import 'package:flutter/material.dart';

class NormalDogGallaryCard extends StatelessWidget {
  final String cardPic;
  const NormalDogGallaryCard({super.key, required this.cardPic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: Colors.grey,
        elevation: 10,
        child: Container(
          color: Colors.white,
          height: 550,
          child: Image.asset(cardPic),
        ),
      ),
    );
  }
}
