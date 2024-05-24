part of 'bookmarks_bloc.dart';

@immutable
sealed class BookmarksState {
  List<MovieModel>? savedMovies;
  BookmarksState({
    this.savedMovies,
  });

  BookmarksState copyWith({
    List<MovieModel>? savedMovies,
  }) {
    return BookmarksInitial(
      savedMovies: savedMovies ?? this.savedMovies,
    );
  }
}

final class BookmarksInitial extends BookmarksState {
  BookmarksInitial({
    super.savedMovies,
  });
}
