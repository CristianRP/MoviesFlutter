import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:movies/src/models/movie_model.dart';

class MoviesProvider {
  String _apiKey   = '4727032e58435cbe848ee26283a0e50b';
  String _url      = 'api.themoviedb.org';
  String _language = 'es-GT';

  Future<List<Movie>> getOnTheaters() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key'  : _apiKey,
      'language' : _language
    });

    final response = await http.get(url);
    final decodedData = json.decode(response.body);

    final movies = Movies.fromJsonList(decodedData['results']);

    //print(movies.items[1].title);

    return movies.items;
  }
}