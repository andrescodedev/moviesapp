import 'package:flutter/material.dart';

class SectionMenuWidget extends StatelessWidget {
  final String section;

  SectionMenuWidget({this.section});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      child: Stack(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section,
            style: TextStyle(fontSize: 12.0, color: Colors.white),
          ),
          Positioned(
            left: 280.0,
            child: Text('See all',
                style: TextStyle(
                    fontSize: 10.0, color: Colors.white.withOpacity(0.5))),
          ),
          Container(),
        ],
      ),
    );
  }
}
