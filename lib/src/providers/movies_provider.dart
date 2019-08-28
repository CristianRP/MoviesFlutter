import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:movies/src/models/movie_model.dart';

class MoviesProvider {
  String _apiKey   = '4727032e58435cbe848ee26283a0e50b';
  String _url      = 'api.themoviedb.org';
  String _language = 'es-GT';

  int _popularPage = 0;
  List<Movie> _popular = List();

  final _popularStreamController = StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get popularSink => _popularStreamController.sink.add;

  Stream<List<Movie>> get popularStream => _popularStreamController.stream;

  void disposeStreams() {
    _popularStreamController?.close();
  }

  Future<List<Movie>> getOnTheaters() async {
    final url = _buildUrl('3/movie/now_playing');
    return await _processResponse(url);
  }

  Future<List<Movie>> getPopular() async {
    _popularPage++;
    final url = _buildUrl('3/movie/popular');
    final response = await _processResponse(url);
    _popular.addAll(response);
    popularSink(_popular);
    return response;
  }

  Future<List<Movie>> _processResponse(Uri url) async {
    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    final movies = Movies.fromJsonList(decodedData['results']);
    return movies.items;
  }

  Uri _buildUrl(String endPoint) {
    return Uri.https(_url, endPoint, {
      'api_key'  : _apiKey,
      'language' : _language,
      'page'     : _popularPage == 0 ? '1' : _popularPage.toString()
    });
  }
}