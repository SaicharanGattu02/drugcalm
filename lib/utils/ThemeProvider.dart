import 'package:flutter/material.dart';

enum AppTheme { device, light, dark }

class ThemeProvider with ChangeNotifier {
  AppTheme _currentTheme;

  ThemeProvider(this._currentTheme);

  ThemeData get themeData  {
    switch (_currentTheme) {
      case AppTheme.light:
        return lightTheme;
      case AppTheme.dark:
        return darkTheme;
      case AppTheme.device:
      default:
        return WidgetsBinding.instance.window.platformBrightness == Brightness.dark ? darkTheme : lightTheme;
    }
  }

  void setTheme(AppTheme theme) {
    _currentTheme = theme;
    notifyListeners();
  }

}

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
);


