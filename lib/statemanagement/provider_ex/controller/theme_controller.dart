import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _darkTheme = false;

  bool get isDarkTheme => _darkTheme;

  void switchTheme() {
    _darkTheme = !_darkTheme;
    notifyListeners();
  }
}
