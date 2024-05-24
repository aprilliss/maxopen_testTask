import 'package:flutter/material.dart';
import 'package:test_maxopen/views/home/home_view.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Size get size => MediaQuery.of(navigatorKey.currentContext!).size;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
