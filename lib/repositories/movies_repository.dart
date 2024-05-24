import 'dart:convert';

import 'package:test_maxopen/models/movie_model.dart';
import 'package:test_maxopen/repositories/interface_movies_repository.dart';
import 'package:http/http.dart' as http;

class MoviesRepository implements IMoviesRepository {
  final String apiAuthorityHost = 'api.themoviedb.org';
  final Map<String, String> headers = {
    'Authorization':
        'Bearer ${const String.fromEnvironment('MOVIE_DB_API_KEY')}',
  };

  /// Get a list of movies that are currently in theatres.
  @override
  Future<List<MovieModel>> getLatestMovies() async {
    http.Response response = await http.get(
        Uri.https(apiAuthorityHost, '/3/movie/now_playing'),
        headers: headers);

    String body = response.body;

    List<dynamic> resultsList = jsonDecode(body)['results'] as List<dynamic>;
    return resultsList.map((e) => MovieModel.fromJson(e)).toList();
  }

  /// Get a list of movies ordered by rating.
  ///
  /// Returns the top 5 movies.
  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    http.Response response = await http.get(
        Uri.https(apiAuthorityHost, '/3/movie/top_rated'),
        headers: headers);

    String body = response.body;
    List<dynamic> resultsList = jsonDecode(body)['results'] as List<dynamic>;
    return resultsList.map((e) => MovieModel.fromJson(e)).take(5).toList();
  }

  /// Search for movies by their original, translated and alternative titles.
  ///
  /// query: The query to search for.
  @override
  Future<List<MovieModel>> search(String query) async {
    http.Response response = await http.get(
        Uri.https(apiAuthorityHost, '/3/search/movie', {'query': query}),
        headers: headers);

    String body = response.body;
    try {
      List<dynamic> resultsList = jsonDecode(body)['results'] as List<dynamic>;
      return resultsList.map((e) => MovieModel.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }
}
