import 'package:dog_catcher/widgets/AppButton.dart';
import 'package:dog_catcher/widgets/Asset.dart';
import 'package:dog_catcher/widgets/IconButton.dart';
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
                  height: 100,
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
                buttonAction: () {},
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
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
                  buttonIcon: Icon(Icons.home),
                  buttonAction: () {},
                ),
                iconButton(
                  buttonIcon: Icon(Icons.contact_page_rounded),
                  buttonAction: () {},
                ),
                iconButton(
                  buttonIcon: Icon(Icons.search),
                  buttonAction: () {},
                ),
                iconButton(
                  buttonIcon: Icon(Icons.explore),
                  buttonAction: () {},
                ),
              ],
            ),
          ),
        ));
  }
}
