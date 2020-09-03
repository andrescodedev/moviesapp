import 'package:flutter/material.dart';
import 'package:prueba_imaginamos/src/models/movie_model.dart';
import 'package:prueba_imaginamos/src/ui/widgets/footer_detail_widget.dart';
import 'package:prueba_imaginamos/src/ui/widgets/information_detail_widget.dart';
import 'package:prueba_imaginamos/src/ui/widgets/list_actors_widget.dart';
import 'package:prueba_imaginamos/src/ui/widgets/overview_detail_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  final Result movie;

  MovieDetailScreen({this.movie});

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2C3848),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            elevation: 30.0,
            pinned: false,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://image.tmdb.org/t/p/w185${widget.movie.backdrop_path}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 10.0,
              ),
              InformationDetailWidget(
                movie: widget.movie,
              ),
              SizedBox(
                height: 10.0,
              ),
              OverviewDetailWidget(
                movie: widget.movie,
              ),
              SizedBox(
                height: 10.0,
              ),
              ListActorsWidget(
                movie: widget.movie,
              ),
              SizedBox(
                height: 10.0,
              ),
              FooterDetailWidget(
                movie: widget.movie,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
