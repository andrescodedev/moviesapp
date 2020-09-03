import 'dart:async';
import 'package:prueba_imaginamos/src/data/movies_datasource.dart';
import 'package:prueba_imaginamos/src/models/credit_model.dart';
import 'package:prueba_imaginamos/src/models/movie_model.dart';

class MovieRepository {
  final moviesDataSource = MoviesDataSource();

  Future<MovieModel> getMoviePlaying() => moviesDataSource.getMoviePlaying();

  Future<MovieModel> getMoviePopular() => moviesDataSource.getMoviePopular();

  Future<CreditModel> getCredits(int movieId) =>
      moviesDataSource.getCredits(movieId);
}
