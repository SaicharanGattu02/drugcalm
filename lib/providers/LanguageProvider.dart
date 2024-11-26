import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  Locale _locale = Locale('en', 'US');  // Default language
  String selectedLanguage = 'en'; // To store the selected language code (e.g., 'en', 'hi', 'es', 'fr')

  Locale get locale => _locale;

  LanguageProvider() {
    _loadLocale();
  }

  // Load previously selected locale
  void _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('languageCode');
    String? countryCode = prefs.getString('countryCode');

    if (languageCode != null && countryCode != null) {
      _locale = Locale(languageCode, countryCode);
      selectedLanguage = languageCode; // Store the language code
      notifyListeners();
    }
  }

  // Change language
  void setLanguage(String languageCode) async {
    if (selectedLanguage != languageCode) {
      selectedLanguage = languageCode;
      _locale = Locale(languageCode, ''); // Set the countryCode as empty or based on your requirement
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('languageCode', languageCode);
      prefs.setString('countryCode', ''); // Update country code if needed
      notifyListeners();
    }
  }
}
