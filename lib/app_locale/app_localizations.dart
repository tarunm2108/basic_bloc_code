import 'package:basic_bloc_code/app_locale/app_localization_delegate.dart';
import 'package:basic_bloc_code/app_locale/locale_string/en.dart';
import 'package:basic_bloc_code/app_locale/locale_string/es.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  late Map<String, String> _localizedStrings;
  final Locale? locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  void load()  {
    final code = locale?.languageCode ?? 'en';
    switch (code) {
      case 'en':
        _localizedStrings = en;
        break;
      case 'es':
        _localizedStrings = es;
        break;
      default:
        _localizedStrings = en;
        break;
    }
  }

  String translate(String key) => _localizedStrings[key] ?? key;

  static const Iterable<Locale> supportedLocales = [
    Locale('en'),
    Locale('es'),
  ];

}
