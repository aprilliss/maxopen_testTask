import 'package:flutter/material.dart';

import 'bottom_navigator.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final CustomBottomBarNavigator navigator;
  const CustomNavigationBar(
      {super.key, required this.currentIndex, required this.navigator});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      iconSize: 20,
      currentIndex: currentIndex,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      selectedItemColor: const Color(0xFFFFC700),
      unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (value) {
        switch (value) {
          case 0:
            navigator.goToHomePage();
            break;
          case 1:
            navigator.goToSearchPage();
            break;
          case 2:
            navigator.goToBookmarksPage();
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline_outlined), label: ''),
      ],
    );
  }
}
