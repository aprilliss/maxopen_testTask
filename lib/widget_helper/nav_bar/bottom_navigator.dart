import 'package:flutter/material.dart';
import 'package:test_maxopen/views/bookmarks/navigation/bookmarks_page_route.dart';
import 'package:test_maxopen/views/home/navigation/home_route.dart';
import 'package:test_maxopen/views/search/navigation/search_page_route.dart';

class CustomBottomBarNavigator {
  final NavigatorState _navigator;
  NavigatorState get navigator => _navigator;
  CustomBottomBarNavigator(BuildContext context)
      : _navigator = Navigator.of(context);

  void goToHomePage() {
    _navigator.pushAndRemoveUntil(HomeRoute(), (route) => false);
  }

  void goToSearchPage() {
    _navigator.push(SearchPageRoute());
  }

  void goToBookmarksPage() {
    _navigator.push(BookmarksPageRoute());
  }
}
