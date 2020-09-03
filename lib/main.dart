import 'package:flutter/material.dart';
import 'package:prueba_imaginamos/src/theme/theme_mode.dart';
import 'package:prueba_imaginamos/src/ui/screens/movie_detail_screen.dart';
import 'package:prueba_imaginamos/src/ui/screens/movie_home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeModeApp>(
      create: (context) => ThemeModeApp(1), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeModeApp = Provider.of<ThemeModeApp>(context);

    return MaterialApp(
      theme: themeModeApp.getCurrentTheme,
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
