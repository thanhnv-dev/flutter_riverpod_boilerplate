import 'package:flutter/material.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/core/common/widgets/app_scaffold.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/core/i18n/generated/locale_keys.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/core/i18n/i18n_func.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/core/theme/theme_controller.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/core/utils/common_utils.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/features/home/presentation/viewModels/home_state.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/features/home/presentation/viewModels/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    final viewModel = ref.read(homeViewModelProvider.notifier);

    return AppScaffold(
      appBar: AppBar(
        title: Text(
          I18nFunc.getLocaleMessage(LocaleKeys.headerTitle),
          style: CommonUtils.getTextTheme(context).headlineLarge?.copyWith(
                color: CommonUtils.getThemeColorScheme(context).onSurface,
              ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: viewModel.refresh,
          ),
          IconButton(
            icon: const Icon(Icons.brightness_4),
            onPressed: ref.read(themeControllerProvider.notifier).changeState,
          ),
        ],
      ),
      child: _buildBody(context, state, viewModel),
    );
  }

  Widget _buildBody(BuildContext context, HomeState state, HomeViewModel viewModel) {
    switch (state.status) {
      case HomeStatus.loading:
        return const Center(child: CircularProgressIndicator());

      case HomeStatus.error:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.errorMessage ?? I18nFunc.getLocaleMessage(LocaleKeys.errorMessage),
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => viewModel.refresh(),
                child: Text(I18nFunc.getLocaleMessage(LocaleKeys.tryAgain)),
              ),
            ],
          ),
        );

      case HomeStatus.success:
        return ListView.builder(
          itemCount: state.posts.length,
          itemBuilder: (context, index) {
            final post = state.posts[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(post.title),
                subtitle: Text(
                  post.body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
