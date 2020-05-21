import 'package:flutter/material.dart';

class ReusedableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onClick;

  ReusedableCard(this.color, this.child, this.onClick);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        child: child,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.9)),
      ),
    );
  }
}
