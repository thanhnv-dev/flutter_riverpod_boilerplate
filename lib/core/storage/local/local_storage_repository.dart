import 'package:flutter_mvvm_riverpod_boilerplate/core/storage/local/local_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_storage_repository.g.dart';

@riverpod
LocalStorageRepository localStorage(Ref ref) {
  return LocalStorageRepositoryImpl(ref);
}

abstract class LocalStorageRepository {
  Future<bool?> getIsDarkTheme();
  Future<void> setIsDarkTheme(bool state);
  Future<void> removeIsDarkTheme();
}
