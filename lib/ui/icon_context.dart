import 'package:flutter/material.dart';

class IconContext extends StatelessWidget {
  final IconData childIcon;
  final String textData;

  IconContext({required this.childIcon, required this.textData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          childIcon,
          color: Colors.white,
          size: 80,
        ),
        SizedBox(height: 10.0),
        Text(
          textData,
          style: TextStyle(
              color: Color(0xff8D8E98),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
