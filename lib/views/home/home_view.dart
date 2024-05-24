import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_maxopen/repositories/movies_repository.dart';
import 'package:test_maxopen/views/home/bloc/home_bloc.dart';
import 'package:test_maxopen/views/latest/latest_movies_view.dart';
import 'package:test_maxopen/widget_helper/movie_widget_horizontal.dart';
import 'package:test_maxopen/widget_helper/movie_widget_latest.dart';
import 'package:test_maxopen/widget_helper/nav_bar/bottom_navigator.dart';
import 'package:test_maxopen/widget_helper/nav_bar/navbar.dart';
import 'package:test_maxopen/widget_helper/title_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(MoviesRepository())..add(HomeLoadEvent()),
      child: const HomeLayout(),
    );
  }
}

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              bottomNavigationBar: CustomNavigationBar(
                currentIndex: 0,
                navigator: CustomBottomBarNavigator(context),
              ),
              backgroundColor: Colors.black,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PageTitleWidget(
                    pageTitle: 'Top Five',
                  ),
                  SizedBox(
                    width: screenWidth,
                    height: screenWidth * 0.7,
                    child: state.topMovies != null
                        ? ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.topMovies!.length,
                            itemBuilder: (context, index) {
                              return MovieWidgetHorizontal(
                                  movie: state.topMovies![index]);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(width: 10);
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          )),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const PageTitleWidget(
                        pageTitle: 'Latest',
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    LatestMoviesPage(state.latestMovies!))),
                        child: const Text('SEE MORE',
                            style: TextStyle(
                                color: Color(0xFFFFC700),
                                fontSize: 16,
                                fontWeight: FontWeight.normal)),
                      ),
                    ],
                  ),
                  state.latestMovies != null
                      ? MovieWidgetLatest(movie: state.latestMovies![0])
                      : const Center(
                          child:
                              CircularProgressIndicator(color: Colors.white)),
                ],
              )),
        );
      },
    );
  }
}
