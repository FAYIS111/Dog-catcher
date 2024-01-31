import 'package:dog_catcher/widgets/AppButton.dart';
import 'package:dog_catcher/widgets/Asset.dart';
import 'package:dog_catcher/widgets/BottomNavigationBar.dart';
import 'package:dog_catcher/widgets/HomePageCard.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Uri _url = Uri.parse('https://ahd.kerala.gov.in/index.php/contact');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                HomePageCard(
                  buttonText: "HELP CENTER",
                  buttonAction: () {
                    _launchUrl();
                  },
                ),
                HomePageCard(
                  buttonText: 'INSTRUCTIONS',
                  buttonAction: () {
                    Navigator.pushNamed(context, '/Instruction');
                  },
                ),
              ],
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 300,
              child: Image.asset(
                Logo5,
                fit: BoxFit.cover,
              ),
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
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
