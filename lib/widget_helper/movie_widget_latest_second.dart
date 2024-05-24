import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:test_maxopen/models/movie_model.dart';
import 'package:test_maxopen/views/movie/navigation/movie_page_route.dart';
import 'package:test_maxopen/widget_helper/bookmark_widget.dart';

class MovieWidgetLatestSecond extends StatelessWidget {
  final MovieModel movie;

  const MovieWidgetLatestSecond({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MoviePageRoute(movie));
      },
      child: SizedBox(
          // width: screenSize / 2,
          child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image.network(
                movie.posterImageUrl,
                width: screenSize / 2,
                // height: 200,
                fit: BoxFit.fitHeight,
              ),
              BookmarkWidget(movie: movie),
            ],
          ),
          const SizedBox(width: 10),
          Text(
            maxLines: 5,
            softWrap: true,
            movie.title,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
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
        ],
      )),
    );
  }
}
