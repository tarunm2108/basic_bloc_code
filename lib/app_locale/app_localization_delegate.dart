import 'package:basic_bloc_code/utils/logger.dart';
import 'package:flutter/material.dart' show Locale, LocalizationsDelegate;
import 'app_localizations.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    Logger.instance.printLog(locale.languageCode);
    AppLocalizations appLocalizations = AppLocalizations(locale);
    appLocalizations.load();
    return appLocalizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
