import 'package:flutter/material.dart';
import 'package:prueba_imaginamos/src/models/movie_model.dart';

class OverviewDetailWidget extends StatelessWidget {
  final Result movie;

  OverviewDetailWidget({Key key, this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        '${movie.overview}',
        textAlign: TextAlign.justify,
        style: TextStyle(color: Colors.white.withOpacity(0.5)),
      ),
    );
  }
}
