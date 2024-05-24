import 'package:flutter/widgets.dart';
import 'package:test_maxopen/views/search/search_page_view.dart';

class SearchPageRoute extends PageRouteBuilder {
  SearchPageRoute()
      : super(
          pageBuilder: (context, animation1, animation2) =>
              const SearchPageView(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
}
