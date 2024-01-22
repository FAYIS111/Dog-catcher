import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartSection extends StatefulWidget {
  const CartSection({super.key});

  @override
  State<CartSection> createState() => _CartSectionState();
}

class _CartSectionState extends State<CartSection> {
  // text fiedl controller

  final CollectionReference dogCollection =
      FirebaseFirestore.instance.collection('dogCollection');

  late Stream<QuerySnapshot> _stream;
  @override
  void initState() {
    super.initState();
    _stream =
        FirebaseFirestore.instance.collection('dogCollection').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload and display Items"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Some error occured${snapshot.error}"),
              );
            }
            // Now , Cheeck if datea arrived?
            if (snapshot.hasData) {
              QuerySnapshot querySnapshot = snapshot.data;
              List<QueryDocumentSnapshot> document = querySnapshot.docs;

              // We need to Convert your documnets to Maps to display
              List<Map> items = document.map((e) => e.data() as Map).toList();

              //At Last, Display the list of items
              return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map thisItems = items[index];
                    return ListTile(
                        title: Text(
                          "${['name']}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        subtitle: Text("${thisItems['number']}"),
                        leading: CircleAvatar(
                          radius: 27,
                          child: thisItems.containsKey('image')
                              ? ClipOval(
                                  child: Image.network(
                                    "${thisItems['image']}",
                                    fit: BoxFit.cover,
                                    height: 70,
                                    width: 70,
                                  ),
                                )
                              : const CircleAvatar(),
                        ));
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
