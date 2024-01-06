import 'package:dog_catcher/widgets/Asset.dart';
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
                color: Color.fromARGB(255, 212, 200, 87),
                child: Center(
                  child: Text('Notification'),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 400,
              child: Image.asset(Logo1),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "GET START",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.greenAccent),
                  minimumSize: MaterialStateProperty.all(
                    Size(double.infinity, 150),
                  ),
                  shadowColor: MaterialStateProperty.all(
                    Colors.grey,
                  ),
                  elevation: MaterialStateProperty.all(9),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
