import 'package:flutter/material.dart';
import 'package:prueba_imaginamos/src/models/movie_model.dart';

class InformationDetailWidget extends StatelessWidget {
  final Result movie;

  InformationDetailWidget({this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Stack(
            children: [
              Text(
                '${movie.original_title}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              ),
              Positioned(
                right: 3.0,
                child: Icon(
                  Icons.movie_filter,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
              Container(),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Stack(
            children: [
              RaisedButton(
                onPressed: () {},
                color: Colors.white.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  'WATCH NOW',
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              ),
              Positioned(
                right: 3.0,
                top: 15.0,
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(0xffFCD307),
                    ),
                    Text(
                      '${movie.vote_count}',
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              Container(),
            ],
          ),
        ],
      ),
    );
  }
}
