import 'package:flutter/material.dart';

class CartPageCard extends StatefulWidget {
  final String firstName;
  final String secondName;
  const CartPageCard({
    super.key,
    required this.firstName,
    required this.secondName,
  });

  @override
  State<CartPageCard> createState() => _CartPageCardState();
}

class _CartPageCardState extends State<CartPageCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            widget.firstName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.secondName),
          ),
        ],
      ),
    );
  }
}
