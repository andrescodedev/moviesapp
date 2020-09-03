import 'package:flutter/material.dart';
import 'package:prueba_imaginamos/src/models/movie_model.dart';

class FooterDetailWidget extends StatelessWidget {
  final Result movie;

  FooterDetailWidget({this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Release',
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                '${movie.release_date}',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.5), fontSize: 12.0),
              )
            ],
          ),
          Row(),
          Row(),
        ],
      ),
    );
  }
}
