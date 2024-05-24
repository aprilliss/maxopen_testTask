import 'package:test_maxopen/shared/constants.dart';

class MovieModel {
  final String posterImageUrl;
  final String backdropImageUrl;
  final String title;
  final String description;
  final double rating;
  final List<int> genre;

  MovieModel({
    required this.posterImageUrl,
    required this.backdropImageUrl,
    required this.title,
    required this.description,
    required this.rating,
    required this.genre,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        posterImageUrl: imagePath + json['poster_path'],
        backdropImageUrl: imagePath + json['backdrop_path'],
        title: json['title'],
        description: json['overview'],
        rating: json['vote_average'].toDouble(),
        genre: json['genre_ids'].map<int>((e) => e as int).toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'poster_path': posterImageUrl,
      'backdrop_path': backdropImageUrl,
      'title': title,
      'overview': description,
      'vote_average': rating,
      'genre_ids': genre
    };
  }
}
