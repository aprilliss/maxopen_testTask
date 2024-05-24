import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:test_maxopen/models/movie_model.dart';
import 'package:test_maxopen/shared/functions.dart';

part 'bookmarks_event.dart';
part 'bookmarks_state.dart';

class BookmarksBloc extends Bloc<BookmarksEvent, BookmarksState> {
  BookmarksBloc() : super(BookmarksInitial()) {
    on<BookmarksEvent>((event, emit) {});

    on<BookmarksLoadSavedMoviesEvent>((event, emit) async {
      List<MovieModel> savedMovies = await getSavedMovies();
      debugPrint('Saved movies: $savedMovies');
      if (savedMovies.isNotEmpty) {
        emit(state.copyWith(savedMovies: savedMovies));
      }
    });
  }
}
