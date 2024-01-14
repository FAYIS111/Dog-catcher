import 'package:dog_catcher/widgets/Asset.dart';
import 'package:dog_catcher/widgets/CarousalScreen.dart';
import 'package:dog_catcher/widgets/StrayDogGallaryCard.dart';
import 'package:flutter/material.dart';

class StrayDogGallary extends StatefulWidget {
  const StrayDogGallary({super.key});

  @override
  State<StrayDogGallary> createState() => _StrayDogGallaryState();
}

class _StrayDogGallaryState extends State<StrayDogGallary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CarouselScreen(
            photos: StrayDogList,
          ),
          StrayDogGallaryCard(cardPic: strayDog1),
          StrayDogGallaryCard(cardPic: strayDog2),
          StrayDogGallaryCard(cardPic: strayDog3),
          StrayDogGallaryCard(cardPic: strayDog4),
          StrayDogGallaryCard(cardPic: strayDog5),
          StrayDogGallaryCard(cardPic: strayDog6),
          StrayDogGallaryCard(cardPic: strayDog7),
          StrayDogGallaryCard(cardPic: strayDog8),
          StrayDogGallaryCard(cardPic: strayDog9),
          StrayDogGallaryCard(cardPic: strayDog10),
          StrayDogGallaryCard(cardPic: strayDog11),
        ],
      ),
    );
  }
}
