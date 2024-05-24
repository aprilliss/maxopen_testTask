part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class SearchStartEvent extends SearchEvent {
  final String query;

  SearchStartEvent(this.query);
}
