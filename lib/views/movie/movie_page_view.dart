import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:test_maxopen/models/movie_model.dart';

class MoviePageView extends StatelessWidget {
  final MovieModel movie;
  const MoviePageView(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left,
              size: 40, color: Color(0xFFFFC700)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              width: MediaQuery.of(context).size.width,
              movie.posterImageUrl,
              fit: BoxFit.cover,
            ),
            Text(
              movie.title,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
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
            ),
            Text(
              movie.description,
              maxLines: 20,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF888888),
              ),
            )
          ],
        ),
      ),
    );
  }
}
