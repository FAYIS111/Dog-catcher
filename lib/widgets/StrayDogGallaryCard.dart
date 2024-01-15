import 'package:flutter/material.dart';

class StrayDogGallaryCard extends StatelessWidget {
  final String cardPic;
  const StrayDogGallaryCard({super.key, required this.cardPic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: Colors.grey,
        elevation: 14,
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: 550,
          child: Image.asset(
            cardPic,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
