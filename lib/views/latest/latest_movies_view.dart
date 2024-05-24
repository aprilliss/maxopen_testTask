import 'package:flutter/material.dart';
import 'package:test_maxopen/models/movie_model.dart';
import 'package:test_maxopen/widget_helper/movie_widget_latest_second.dart';
import 'package:test_maxopen/widget_helper/title_widget.dart';

class LatestMoviesPage extends StatelessWidget {
  final List<MovieModel> movies;
  const LatestMoviesPage(this.movies, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: const PageTitleWidget(
              pageTitle: 'Latest',
            ),
            leading: IconButton(
                icon: const Icon(Icons.keyboard_arrow_left,
                    size: 40, color: Color(0xFFFFC700)),
                onPressed: () {
                  Navigator.pop(context);
                })),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return MovieWidgetLatestSecond(movie: movies[index]);
          },
        ));
  }
}
