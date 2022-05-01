import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  final Color color;
  final Widget childCard;
  ReuseableCard({required this.color, required this.childCard});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: childCard,
      margin: EdgeInsets.all(15),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    );
  }
}
