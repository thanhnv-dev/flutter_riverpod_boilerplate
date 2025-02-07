import 'package:flutter/material.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/core/i18n/i18n.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/core/i18n/i18n_func.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/core/theme/app_theme.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/core/theme/theme_controller.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/routes/route_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/di/app_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = await appProviderContainer();

  runApp(
    await I18n.init(
      child: UncontrolledProviderScope(
        container: container,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    ref.read(themeControllerProvider.notifier).initTheme();
  }

  @override
  Widget build(BuildContext context) {
    ThemeMode? themeMode = ref.watch(themeControllerProvider);

    return MaterialApp.router(
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      themeMode: themeMode,
      localizationsDelegates: I18nFunc.getLocalizationDelegates(context),
      supportedLocales: I18nFunc.getSupportedLocales(context),
      routerConfig: _appRouter.config(),
    );
  }
}
