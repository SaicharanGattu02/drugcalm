import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  Locale _locale = Locale('en', 'US');  // Default language

  Locale get locale => _locale;

  LanguageProvider() {
    _loadLocale();
  }

  void _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('languageCode');
    String? countryCode = prefs.getString('countryCode');

    if (languageCode != null && countryCode != null) {
      _locale = Locale(languageCode, countryCode);
      notifyListeners();
    }
  }

  void setLocale(Locale locale) async {
    if (_locale != locale) {
      _locale = locale;
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('languageCode', locale.languageCode);
      prefs.setString('countryCode', locale.countryCode ?? '');
      notifyListeners();
    }
  }
}
