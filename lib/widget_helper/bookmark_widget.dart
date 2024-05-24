import 'package:flutter/material.dart';
import 'package:test_maxopen/models/movie_model.dart';
import 'package:test_maxopen/shared/functions.dart';

class BookmarkWidget extends StatefulWidget {
  bool isBookmarked;
  final MovieModel movie;
  BookmarkWidget({super.key, required this.movie, this.isBookmarked = false});

  @override
  State<BookmarkWidget> createState() => _BookmarkWidgetState();
}

class _BookmarkWidgetState extends State<BookmarkWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          setState(() {
            widget.isBookmarked = !widget.isBookmarked;
          });
          if (widget.isBookmarked) {
            removeMovie(widget.movie).then((value) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Movie removed from bookmarks')));
            });
          } else {
            saveMovie(widget.movie).then((value) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Movie saved to bookmarks')));
            });
          }
        },
        icon: widget.isBookmarked
            ? const Icon(
                size: 40,
                Icons.bookmark,
                color: Colors.white,
              )
            : const Icon(
                size: 40,
                Icons.bookmark_outline_rounded,
                color: Colors.white,
              ));
  }
}
