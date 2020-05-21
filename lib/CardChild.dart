import 'package:flutter/material.dart';
import 'Constants.dart';

class CardChild extends StatelessWidget {
  final IconData icon;
  final String text;

  CardChild(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 80.0),
        SizedBox(height: 15.5),
        Text(text, style: LableTextStyle)
      ],
    );
  }
}