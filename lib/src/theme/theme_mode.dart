import 'package:flutter/material.dart';

class ThemeModeApp with ChangeNotifier {
  bool _darkTheme = false;
  ThemeData _currentTheme;

  ThemeModeApp(int theme) {
    switch (theme) {
      case 1:
        {
          //light
          this._darkTheme = false;
          this._currentTheme = ThemeData.light().copyWith(
            scaffoldBackgroundColor: Color(0xff5CA0D3),
          );
        }
        break;
      case 2:
        {
          //dark
          this._darkTheme = true;
          this._currentTheme = ThemeData.dark();
        }
        break;
      default:
        {
          this._darkTheme = false;
          this._currentTheme = ThemeData.light().copyWith(
            scaffoldBackgroundColor: Color(0xff5CA0D3),
          );
        }
    }
  }

  bool get getDarkTheme => this._darkTheme;
  ThemeData get getCurrentTheme => this._currentTheme;

  set setDarkTheme(bool dark) {
    this._darkTheme = dark;
    if (dark) {
      this._currentTheme = ThemeData.dark();
    } else {
      this._currentTheme = ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(0xff5CA0D3),
      );
    }
    notifyListeners();
  }
}
