import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:movies/src/models/movie_model.dart';

class MoviesProvider {
  String _apiKey   = '4727032e58435cbe848ee26283a0e50b';
  String _url      = 'api.themoviedb.org';
  String _language = 'es-GT';

  Future<List<Movie>> getOnTheaters() async {
    final url = _buildUrl('3/movie/now_playing');

    final response = await http.get(url);
    final decodedData = json.decode(response.body);

    final movies = Movies.fromJsonList(decodedData['results']);

    //print(movies.items[1].title);

    return movies.items;
  }

  Future<List<Movie>> getPopular() async {
    final url = _buildUrl('3/movie/popular');
    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    final movies = Movies.fromJsonList(decodedData['results']);
    return movies.items;
  }

  Uri _buildUrl(String endPoint) {
    return Uri.https(_url, endPoint, {
      'api_key'  : _apiKey,
      'language' : _language
    });
  }
}