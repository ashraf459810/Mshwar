import 'dart:async';
import 'package:flutter/material.dart';
import '../app_localizations.dart';

class AppLocalizationsDelegate
    extends LocalizationsDelegate<ApplicationLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      true; //['ar', 'en'].contains(locale.languageCode);

  @override
  Future<ApplicationLocalizations> load(Locale locale) async {
    ApplicationLocalizations localizations =
        new ApplicationLocalizations(locale);
    await localizations.load();
    print("Load ${locale.languageCode}");
    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
