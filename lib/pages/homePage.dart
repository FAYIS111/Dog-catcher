import 'package:dog_catcher/widgets/AppButton.dart';
import 'package:dog_catcher/widgets/Asset.dart';
import 'package:dog_catcher/widgets/BottomNavigationBar.dart';
import 'package:dog_catcher/widgets/CarousalScreen.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: double.infinity,
                height: 50,
                color: Colors.yellow,
                child: Center(
                  child: Text('Notification'),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 300,
              child: Image.asset(Logo5),
            ),
            appButton(
              width: 350,
              height: 100,
              color: MaterialStateProperty.all(Colors.greenAccent),
              buttonText: "GET START",
              buttonAction: () {
                Navigator.pushNamed(context, '/CommonPage');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
