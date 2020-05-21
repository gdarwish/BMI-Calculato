import 'package:flutter/material.dart';
import 'Constants.dart';

class BottomButton extends StatelessWidget {

  final Function onClick;
  final String title;
  BottomButton(this.onClick, this.title);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        child: Center(child: Text(title, style: LableResultButton,)),
        color: BottemColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}