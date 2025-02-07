import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'i18n_constant.dart';
import 'generated/codegen_loader.g.dart';

class I18n {
  static Future<EasyLocalization> init({
    required Widget child,
  }) async {
    await EasyLocalization.ensureInitialized();

    return EasyLocalization(
      supportedLocales: const [I18nConstants.appLanguageEn, I18nConstants.appLanguageVi],
      startLocale: I18nConstants.appLanguageEn,
      fallbackLocale: I18nConstants.appLanguageEn,
      path: I18nConstants.pathLanguage,
      assetLoader: const CodegenLoader(),
      child: child,
    );
  }
}
