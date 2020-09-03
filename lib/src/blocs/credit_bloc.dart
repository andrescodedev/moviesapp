import 'package:prueba_imaginamos/src/data/movie_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:prueba_imaginamos/src/models/credit_model.dart';

class CreditBloc {
  final _repository = MovieRepository();
  final _actors = PublishSubject<CreditModel>();

  Observable<CreditModel> get actors => _actors.stream;

  getActors(int movieId) async {
    CreditModel creditModel = await _repository.getCredits(movieId);
    _actors.sink.add(creditModel);
  }

  void dispose() async {
    await _actors.drain();
    _actors.close();
  }
}

final creditBloc = CreditBloc();
