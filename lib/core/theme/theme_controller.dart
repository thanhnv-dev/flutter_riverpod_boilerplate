import 'package:flutter/material.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/core/storage/local/local_storage_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  @override
  ThemeMode build() => ThemeMode.system;

  Future initTheme() async {
    final coreLocalStorage = ref.read(localStorageProvider);
    bool? isDarkTheme = await coreLocalStorage.getIsDarkTheme();
    if (isDarkTheme == null) {
      state = ThemeMode.system;
    } else {
      state = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    }
  }

  Future<void> changeState() async {
    final coreLocalStorage = ref.read(localStorageProvider);
    final newState = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await coreLocalStorage.setIsDarkTheme(newState == ThemeMode.dark);
    state = newState;
  }
}
