import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:prueba_imaginamos/src/models/credit_model.dart';
import 'package:prueba_imaginamos/src/models/movie_model.dart';

class MoviesDataSource {
  Client client = Client();
  final _apikey = '1865f43a0549ca50d341dd9ab8b29f49';
  final _url = 'http://api.themoviedb.org/3/movie';

  Future<MovieModel> getMoviePlaying() async {
    final response = await client.get("$_url/now_playing?api_key=$_apikey");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return MovieModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Error al cargar los datos');
    }
  }

  Future<MovieModel> getMoviePopular() async {
    final response = await client.get("$_url/top_rated?api_key=$_apikey");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return MovieModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Error al cargar los datos');
    }
  }

  Future<CreditModel> getCredits(int movieId) async {
    final response =
        await client.get("$_url/$movieId/credits?api_key=$_apikey");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return CreditModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Error al cargar los datos');
    }
  }

  /*Future<List<Pelicula>> buscarPelicula(String query) async {
    final url = Uri.https(_url, '3/search/movie', {
      'api_key': _apikey,
      'language': _lenguage,
      'query': query,
    });

    return await _responseProcess(url);
  }*/
}
