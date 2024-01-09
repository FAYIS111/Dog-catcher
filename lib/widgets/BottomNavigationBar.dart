import 'package:dog_catcher/widgets/IconButton.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 2,
        left: 2,
      ),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(
            width: 1,
            color: Colors.purple,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13),
            topRight: Radius.circular(13),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconButton(
              buttonIcon: Icon(Icons.person_4_rounded),
              buttonAction: () {},
            ),
            iconButton(
              buttonIcon: Icon(Icons.search),
              buttonAction: () {},
            ),
            iconButton(
              buttonIcon: Icon(Icons.notifications),
              buttonAction: () {},
            ),
            iconButton(
              buttonIcon: Icon(Icons.explore),
              buttonAction: () {},
            ),
          ],
        ),
      ),
    );
  }
}
