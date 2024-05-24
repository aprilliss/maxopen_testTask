part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  List<MovieModel>? latestMovies;
  List<MovieModel>? topMovies;

  HomeState({
    this.latestMovies,
    this.topMovies,
  });

  HomeState copyWith({
    List<MovieModel>? latestMovies,
    List<MovieModel>? topMovies,
  }) {
    return HomeInitial(
      latestMovies: latestMovies ?? this.latestMovies,
      topMovies: topMovies ?? this.topMovies,
    );
  }
}

final class HomeInitial extends HomeState {
  HomeInitial({
    super.latestMovies,
    super.topMovies,
  });
}
