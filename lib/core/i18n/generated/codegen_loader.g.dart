// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _en = {
  "headerTitle": "Posts",
  "errorMessage": "Something went wrong!",
  "tryAgain": "Try again"
};
static const Map<String,dynamic> _vi = {
  "headerTitle": "Bài viết",
  "errorMessage": "Có lỗi xảy ra!",
  "tryAgain": "Thử lại"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en, "vi": _vi};
}
