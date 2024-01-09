import 'package:dog_catcher/widgets/Asset.dart';
import 'package:dog_catcher/widgets/CommonPageCard.dart';
import 'package:flutter/material.dart';

class CommonPage extends StatefulWidget {
  const CommonPage({super.key});

  @override
  State<CommonPage> createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            CommonPageCard(
              cardText: "REPORT INCIDENTS",
              cardImage: normal2,
              fit: BoxFit.cover,
              clickAction: () {
                Navigator.pushNamed(context, '/ReportPage');
              },
            ),
            CommonPageCard(
              cardText: "STRAY DOG GALLARY",
              cardImage: normal3,
              fit: BoxFit.fill,
              clickAction: () {},
            ),
            CommonPageCard(
              cardText: "NORMAL DOGS GALLARY",
              cardImage: normal1,
              fit: BoxFit.cover,
              clickAction: () {},
            ),
            Container(
              height: 700,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
