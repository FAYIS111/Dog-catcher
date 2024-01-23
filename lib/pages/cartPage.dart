import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_catcher/widgets/cartPageCard.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  final CollectionReference strayDog =
      FirebaseFirestore.instance.collection('dogCollection');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Section'),
        backgroundColor: Colors.greenAccent,
      ),
      body: StreamBuilder(
          stream: strayDog.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, Index) {
                    final DocumentSnapshot dogSnap = snapshot.data!.docs[Index];
                    return Container(
                      width: double.infinity,
                      height: 650,
                      child: Card(
                        shadowColor: Colors.grey,
                        elevation: 14,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CartPageCard(
                                firstName: 'User Name :',
                                secondName: dogSnap['userName']),
                            CartPageCard(
                                firstName: 'Contact No :',
                                secondName: dogSnap['contactNo']),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.grey.shade300,
                                height: 150,
                                child: CartPageCard(
                                    firstName: 'Report :',
                                    secondName: dogSnap['description']),
                              ),
                            ),
                            ListTile(
                              title: const Text(
                                'Location :',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(dogSnap['location']),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                height: 250,
                                child: Image.network(
                                  dogSnap['imageURL'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
            return Container();
          }),
    );
  }
}
