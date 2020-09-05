import 'package:flutter/material.dart';
import 'package:prueba_imaginamos/src/blocs/movie_bloc.dart';
import 'package:prueba_imaginamos/src/models/movie_model.dart';
import 'package:prueba_imaginamos/src/ui/screens/movie_detail_screen.dart';
import 'package:animate_do/animate_do.dart';

class MoviepopularListWidget extends StatefulWidget {
  @override
  _MoviepopularListWidgetState createState() => _MoviepopularListWidgetState();
}

class _MoviepopularListWidgetState extends State<MoviepopularListWidget> {
  MovieBloc movieBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movieBloc = MovieBloc();
    movieBloc.getMoviePopular();
  }

  @override
  void dispose() {
    movieBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: movieBloc.moviesPopular,
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
                        child: BounceInUp(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w185${movie.poster_path}'),
                                  fit: BoxFit.fill,
                                )),
                          ),
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
                    SizedBox(
                      height: 5.0,
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
