import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class I18nFunc {
  static String getLocaleMessage(String key) {
    return key.tr();
  }

  static String getLocaleMessageWithPlural(String key, List<String> args) {
    return plural(
      key: key,
      args: args,
    );
  }

  static String converDateOfBirth(String date) {
    try {
      return DateFormat('dd MMMM yyyy').format(DateTime.parse(date.toString()).toLocal());
    } catch (e) {
      return '';
    }
  }

  static void setLocale(BuildContext context, Locale locale) {
    context.setLocale(locale);
  }

  static Locale getLocale(BuildContext context) {
    return context.locale;
  }

  static List<Locale> getSupportedLocales(BuildContext context) {
    return context.supportedLocales;
  }

  static List<LocalizationsDelegate<dynamic>> getLocalizationDelegates(BuildContext context) {
    return context.localizationDelegates;
  }

  static String plural({
    required String key,
    num value = 0,
    List<String>? args,
  }) {
    return key.plural(value, args: args);
  }
}
