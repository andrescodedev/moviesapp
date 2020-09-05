import 'package:prueba_imaginamos/src/data/movie_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:prueba_imaginamos/src/models/movie_model.dart';

class MovieBloc {
  final _repository = MovieRepository();
  final _moviesPlaying = PublishSubject<MovieModel>();
  final _moviesPopular = PublishSubject<MovieModel>();

  Observable<MovieModel> get moviesPlaying => _moviesPlaying.stream;
  Observable<MovieModel> get moviesPopular => _moviesPopular.stream;

  getMoviePlaying() async {
    MovieModel movieModel = await _repository.getMoviePlaying();
    _moviesPlaying.sink.add(movieModel);
  }

  getMoviePopular() async {
    MovieModel movieModel = await _repository.getMoviePopular();
    _moviesPopular.sink.add(movieModel);
  }

  dispose() {
    _moviesPlaying.drain();
    _moviesPopular.drain();
    _moviesPlaying.close();
    _moviesPopular.close();
  }
}
