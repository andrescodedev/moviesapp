import 'package:flutter/material.dart';
import 'package:prueba_imaginamos/src/ui/screens/movie_detail_screen.dart';
import 'package:prueba_imaginamos/src/ui/screens/movie_home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie app',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => MovieHomeScreen(),
        '/detail': (BuildContext context) => MovieDetailScreen(),
      },
    );
  }
}
