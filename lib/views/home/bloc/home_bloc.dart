import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:test_maxopen/models/movie_model.dart';
import 'package:test_maxopen/repositories/movies_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// The repository for the movies
  final MoviesRepository _moviesRepository;

  HomeBloc(MoviesRepository repository)
      : _moviesRepository = repository,
        super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});

    /// Event to load the top rated movies and update the state.
    on<HomeLoadEvent>((event, emit) async {
      debugPrint('HomeLoadEvent');
      List<MovieModel> topMovies = await _moviesRepository.getTopRatedMovies();
      List<MovieModel> latestMovies = await _moviesRepository.getLatestMovies();

      emit(state.copyWith(topMovies: topMovies, latestMovies: latestMovies));
    });
  }
}
