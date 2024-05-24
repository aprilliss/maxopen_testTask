import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_maxopen/models/movie_model.dart';

Future<void> saveMovie(MovieModel movie) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  if (prefs.containsKey('savedMovies')) {
    List<String> savedMovies = prefs.getStringList('savedMovies')!;
    savedMovies.add(jsonEncode(movie.toJson()));
    prefs.setStringList('savedMovies', savedMovies);
  } else {
    prefs.setStringList('savedMovies', [jsonEncode(movie.toJson())]);
  }
}

Future<List<MovieModel>> getSavedMovies() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  if (prefs.containsKey('savedMovies')) {
    List<String> savedMovies = prefs.getStringList('savedMovies')!;
    return savedMovies.map((e) => MovieModel.fromJson(jsonDecode(e))).toList();
  } else {
    return [];
  }
}

Future<bool> checkIfBookmarked(MovieModel movie) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String encodedMovie = jsonEncode(movie.toJson());

  if (prefs.containsKey('savedMovies')) {
    List<String> savedMovies = prefs.getStringList('savedMovies')!;
    return savedMovies.contains(encodedMovie);
  }
  return false;
}

Future<void> removeMovie(MovieModel movie) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String encodedMovie = jsonEncode(movie.toJson());

  if (prefs.containsKey('savedMovies')) {
    List<String> savedMovies = prefs.getStringList('savedMovies')!;
    savedMovies.remove(encodedMovie);
    prefs.setStringList('savedMovies', savedMovies);
  }
}
