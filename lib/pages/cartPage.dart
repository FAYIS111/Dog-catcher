import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_catcher/widgets/AppButton.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CollectionReference dogCollection =
      FirebaseFirestore.instance.collection('dogCollection');
  late String lat;
  late String long;

  Future<void> _openMap(String lat, String long) async {
    String googleURL =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    await canLaunchUrlString(googleURL)
        ? await launchUrlString(googleURL)
        : throw 'Could not launch $googleURL';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: dogCollection.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, Index) {
                    final DocumentSnapshot donorSnap =
                        snapshot.data!.docs[Index];
                    return Column(
                      children: [
                        Container(
                          height: 280,
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(donorSnap['description']),
                                    Text(donorSnap['contactNo'].toString()),
                                    Text(donorSnap['location']),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    appButton(
                                      buttonText: 'View google map',
                                      buttonAction: () {
                                        _openMap(lat = donorSnap['location'],
                                            long = donorSnap['location']);
                                      },
                                    ),
                                    appButton(
                                      buttonText: 'Gallary',
                                      buttonAction: () {
                                        Navigator.pushNamed(
                                            context, '/AdminPanal');
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            }
            return Container();
          }),
    );
  }
}
