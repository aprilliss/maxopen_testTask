import 'package:test_maxopen/models/movie_model.dart';

abstract class IMoviesRepository {
  Future<List<MovieModel>> getLatestMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<MovieModel>> search(String query);
}
