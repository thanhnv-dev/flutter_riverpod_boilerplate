import 'package:flutter_mvvm_riverpod_boilerplate/core/di/providers.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/core/storage/models/storage_keys.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/core/storage/local/local_storage_repository.dart';

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  final Ref _ref;

  LocalStorageRepositoryImpl(this._ref);

  Future<SharedPreferences> get _prefs => _ref.read(sharedPreferencesProvider.future);

  @override
  Future<bool?> getIsDarkTheme() async {
    final prefs = await _prefs;
    try {
      final isDarkThemeEncoded = prefs.getBool(StorageKeys.isDarkTheme.name);
      if (isDarkThemeEncoded == null) {
        return null;
      } else {
        return isDarkThemeEncoded;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setIsDarkTheme(bool state) async {
    final prefs = await _prefs;
    await prefs.setBool(StorageKeys.isDarkTheme.name, state);
  }

  @override
  Future<void> removeIsDarkTheme() async {
    final prefs = await _prefs;
    await prefs.remove(StorageKeys.isDarkTheme.name);
  }
}
