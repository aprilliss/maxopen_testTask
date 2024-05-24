part of 'bookmarks_bloc.dart';

@immutable
sealed class BookmarksEvent {}

class BookmarksLoadSavedMoviesEvent extends BookmarksEvent {}
