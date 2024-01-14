import 'package:dog_catcher/widgets/Asset.dart';
import 'package:dog_catcher/widgets/CarousalScreen.dart';
import 'package:dog_catcher/widgets/NormalDogGallaryCard.dart';
import 'package:flutter/material.dart';

class NormalDogGallary extends StatefulWidget {
  const NormalDogGallary({super.key});

  @override
  State<NormalDogGallary> createState() => _NormalDogGallaryState();
}

class _NormalDogGallaryState extends State<NormalDogGallary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CarouselScreen(
            photos: carousalPics,
          ),
          NormalDogGallaryCard(cardPic: normalDog1),
          NormalDogGallaryCard(cardPic: normalDog2),
          NormalDogGallaryCard(cardPic: normalDog3),
          NormalDogGallaryCard(cardPic: normalDog4),
          NormalDogGallaryCard(cardPic: normalDog5),
          NormalDogGallaryCard(cardPic: normalDog6),
          NormalDogGallaryCard(cardPic: normalDog7),
          NormalDogGallaryCard(cardPic: normalDog8),
          NormalDogGallaryCard(cardPic: normalDog9),
          NormalDogGallaryCard(cardPic: normalDog10),
          NormalDogGallaryCard(cardPic: normalDog11),
        ],
      ),
    );
  }
}
