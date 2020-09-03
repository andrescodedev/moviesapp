import 'package:flutter/material.dart';
import 'package:prueba_imaginamos/src/blocs/movie_bloc.dart';
import 'package:prueba_imaginamos/src/models/movie_model.dart';
import 'package:prueba_imaginamos/src/ui/screens/movie_detail_screen.dart';
import 'package:rxdart/rxdart.dart';

class MovieplayingListWidget extends StatefulWidget {
  final Observable<MovieModel> observable;

  MovieplayingListWidget({this.observable});

  @override
  _MovieplayingListWidgetState createState() => _MovieplayingListWidgetState();
}

class _MovieplayingListWidgetState extends State<MovieplayingListWidget> {
  @override
  void initState() {
    super.initState();
    bloc.getMoviePlaying();
    bloc.getMoviePopular();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.observable,
      builder: (context, AsyncSnapshot<MovieModel> snapshot) {
        if (snapshot.hasData) {
          List<Result> movies = snapshot.data.results;

          return ListView.builder(
            itemCount: movies.length,
            physics: BouncingScrollPhysics(),
            //reverse: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final movie = movies[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints:
                          BoxConstraints(maxHeight: 120.0, maxWidth: 100.0),
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w185${movie.poster_path}'),
                                fit: BoxFit.fill,
                              )),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailScreen(
                                  movie: movie,
                                ),
                              ));
                        },
                      ),
                    ),
                    ConstrainedBox(
                      constraints:
                          BoxConstraints(maxWidth: 100.0, maxHeight: 30.0),
                      child: Text('${movie.title}',
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.0)),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xffFCD307),
                        ),
                        Text(
                          '${movie.vote_count}',
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('Lo sentimos, no se cargaron los datos');
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
