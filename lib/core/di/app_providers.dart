import 'package:flutter/material.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/core/di/providers.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/core/theme/theme_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ProviderContainer> appProviderContainer() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWith((ref) => Future.value(prefs)),
    ],
  );

  await initializeProviders(container);

  return container;
}

Future<void> initializeProviders(ProviderContainer container) async {
  container.read(themeControllerProvider);
}
