import 'dart:ui';

import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30.0,
        right: 10.0,
        top: 10.0,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 40.0, maxWidth: 280.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
            color: Colors.white.withOpacity(0.3),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                labelStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
