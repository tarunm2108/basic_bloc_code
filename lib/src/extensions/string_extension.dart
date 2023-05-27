import 'package:basic_bloc_code/app_locale/app_localizations.dart';
import 'package:flutter/material.dart';

extension TranslateString on String {
  String tr(BuildContext context) {
    return AppLocalizations.of(context)?.translate(this) ?? this;
  }
}
