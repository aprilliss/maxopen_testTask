import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_maxopen/views/bookmarks/bloc/bookmarks_bloc.dart';
import 'package:test_maxopen/widget_helper/movie_widget_latest.dart';
import 'package:test_maxopen/widget_helper/nav_bar/bottom_navigator.dart';
import 'package:test_maxopen/widget_helper/nav_bar/navbar.dart';
import 'package:test_maxopen/widget_helper/title_widget.dart';

class BookmarksPageView extends StatelessWidget {
  const BookmarksPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookmarksBloc()..add(BookmarksLoadSavedMoviesEvent()),
      child: const BookmarksPageLayout(),
    );
  }
}

class BookmarksPageLayout extends StatelessWidget {
  const BookmarksPageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarksBloc, BookmarksState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                  icon: const Icon(Icons.keyboard_arrow_left,
                      size: 40, color: Color(0xFFFFC700)),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: const PageTitleWidget(
                pageTitle: 'Bookmarks',
              ),
            ),
            bottomNavigationBar: CustomNavigationBar(
              currentIndex: 2,
              navigator: CustomBottomBarNavigator(context),
            ),
            body: state.savedMovies != null
                ? SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: state.savedMovies!.length,
                      itemBuilder: (context, index) {
                        return MovieWidgetLatest(
                            movie: state.savedMovies![index]);
                      },
                    ),
                  )
                : const Center(
                    child: Text('No saved movies found!',
                        style: TextStyle(color: Colors.white))));
      },
    );
  }
}
