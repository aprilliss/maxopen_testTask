part of 'search_bloc.dart';

@immutable
sealed class SearchState {
  final List<MovieModel>? searchResults;

  const SearchState({this.searchResults});

  SearchState copyWith({List<MovieModel>? searchResults}) {
    return SearchInitial(searchResults: searchResults ?? this.searchResults);
  }
}

final class SearchInitial extends SearchState {
  const SearchInitial({super.searchResults});
}
