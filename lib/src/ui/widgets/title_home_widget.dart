import 'package:flutter/material.dart';

class TitleHomeWidget extends StatelessWidget {
  final String title;
  final double fontSize;

  TitleHomeWidget({this.title, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0, top: 10.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
