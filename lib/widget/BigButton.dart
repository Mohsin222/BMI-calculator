import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  BigButton({required this.btnText});
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.pink,
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          btnText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
