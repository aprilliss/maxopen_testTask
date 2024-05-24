import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:test_maxopen/models/movie_model.dart';
import 'package:test_maxopen/views/movie/navigation/movie_page_route.dart';
import 'package:test_maxopen/widget_helper/bookmark_widget.dart';

class MovieWidgetHorizontal extends StatelessWidget {
  final MovieModel movie;

  const MovieWidgetHorizontal({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MoviePageRoute(movie));
      },
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(alignment: Alignment.topRight, children: [
              Image.network(
                movie.backdropImageUrl,
                width: 300,
                height: 200,
                fit: BoxFit.fitHeight,
              ),
              BookmarkWidget(movie: movie)
            ]),
            Text(
              movie.title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  movie.rating.toStringAsPrecision(2),
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 10),
                RatingStars(
                  starColor: const Color(0xFFFFC700),
                  starSize: 25,
                  axis: Axis.horizontal,
                  maxValue: 10.0,
                  maxValueVisibility: false,
                  value: movie.rating,
                  valueLabelVisibility: false,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
