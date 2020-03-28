import 'package:flutter/foundation.dart';

class ThemeSwitcher with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDark => _isDarkMode;

  void switchTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}