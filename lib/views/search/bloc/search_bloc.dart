import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:test_maxopen/models/movie_model.dart';
import 'package:test_maxopen/repositories/movies_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MoviesRepository _moviesRepository;

  SearchBloc(MoviesRepository moviesRepository)
      : _moviesRepository = moviesRepository,
        super(const SearchInitial()) {
    on<SearchEvent>((event, emit) {});

    on<SearchStartEvent>((event, emit) async {
      List<MovieModel> search = await _moviesRepository.search(event.query);
      debugPrint('Found ${search.length} movies for query: ${event.query}');
      emit(state.copyWith(searchResults: search));
    });
  }
}
