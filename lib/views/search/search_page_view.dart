import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_maxopen/repositories/movies_repository.dart';
import 'package:test_maxopen/views/search/bloc/search_bloc.dart';
import 'package:test_maxopen/widget_helper/movie_widget_latest.dart';
import 'package:test_maxopen/widget_helper/nav_bar/bottom_navigator.dart';
import 'package:test_maxopen/widget_helper/nav_bar/navbar.dart';
import 'package:test_maxopen/widget_helper/title_widget.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(MoviesRepository()),
      child: const SearchPageLayout(),
    );
  }
}

class SearchPageLayout extends StatelessWidget {
  const SearchPageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    SearchBloc bloc = context.read<SearchBloc>();
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
                backgroundColor: Colors.black,
                title: const PageTitleWidget(pageTitle: 'Search'),
                leading: IconButton(
                    icon: const Icon(Icons.keyboard_arrow_left,
                        size: 40, color: Color(0xFFFFC700)),
                    onPressed: () {
                      Navigator.pop(context);
                    })),
            bottomNavigationBar: CustomNavigationBar(
              currentIndex: 1,
              navigator: CustomBottomBarNavigator(context),
            ),
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextField(
                  onSubmitted: (value) {
                    bloc.add(SearchStartEvent(value));
                  },
                  textInputAction: TextInputAction.search,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white)))),
              if (state.searchResults != null) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: BorderSide.strokeAlignCenter),
                  child: Text(
                      'Search Results (${state.searchResults?.length ?? 0})',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.searchResults!.length,
                    itemBuilder: (context, index) {
                      return MovieWidgetLatest(
                          movie: state.searchResults![index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 20);
                    },
                  ),
                )
              ] else ...[
                const Center(
                    child: Text('No search results',
                        style: TextStyle(color: Colors.white)))
              ]
            ]));
      },
    );
  }
}
