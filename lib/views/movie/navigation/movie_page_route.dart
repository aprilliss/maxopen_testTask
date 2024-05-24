import 'package:flutter/widgets.dart';
import 'package:test_maxopen/models/movie_model.dart';
import 'package:test_maxopen/views/movie/movie_page_view.dart';

class MoviePageRoute extends PageRouteBuilder {
  MoviePageRoute(MovieModel movie)
      : super(
          pageBuilder: (context, animation1, animation2) =>
              MoviePageView(movie),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
}
