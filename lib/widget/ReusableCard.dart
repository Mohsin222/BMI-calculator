import 'package:flutter/material.dart';

class ReusabelCard extends StatelessWidget {
  ReusabelCard({required this.colour, required this.cardChild});
  final Widget cardChild;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.all(10.0),
      child: cardChild,
    );
  }
}
