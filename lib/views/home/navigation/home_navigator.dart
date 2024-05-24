import 'package:flutter/material.dart';


class HomeNavigator {
  final NavigatorState _navigator;

  NavigatorState get navigator => _navigator;

  HomeNavigator(BuildContext context) : _navigator = Navigator.of(context);

 
}
