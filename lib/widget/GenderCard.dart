import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/utilities/constant.dart';

class GenderCard extends StatelessWidget {
  GenderCard({required this.genderIcon, required this.genderText});
  final IconData genderIcon;
  final String genderText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(genderText, style: MaintextStyle),
        )
      ],
    );
  }
}
