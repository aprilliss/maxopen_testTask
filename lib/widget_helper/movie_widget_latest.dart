import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:test_maxopen/models/movie_model.dart';
import 'package:test_maxopen/shared/constants.dart';
import 'package:test_maxopen/views/movie/navigation/movie_page_route.dart';
import 'package:test_maxopen/widget_helper/bookmark_widget.dart';

class MovieWidgetLatest extends StatelessWidget {
  final MovieModel movie;

  const MovieWidgetLatest({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MoviePageRoute(movie));
      },
      child: SizedBox(
          width: screenSize,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.network(
                    movie.posterImageUrl,
                    width: screenSize / 2,
                    fit: BoxFit.fitHeight,
                  ),
                  BookmarkWidget(movie: movie),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 5,
                      softWrap: true,
                      movie.title,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
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
                    Text(movie.genre.map((e) => genres[e]).join(', '),
                        style:
                            const TextStyle(fontSize: 13, color: Colors.white)),
                    Text(
                      maxLines: 8,
                      softWrap: true,
                      movie.description,
                      style: const TextStyle(
                          fontSize: 13, color: Color(0xFF888888)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
