import 'package:flutter_mvvm_riverpod_boilerplate/core/di/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'home_state.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeState build() {
    Future(() async {
      await getPosts();
    });

    return HomeState();
  }

  Future<void> getPosts() async {
    try {
      state = state.copyWith(status: HomeStatus.loading);

      final posts = await ref.read(postRepositoryProvider).getPosts();

      state = state.copyWith(
        status: HomeStatus.success,
        posts: posts,
      );
    } catch (e) {
      state = state.copyWith(
        status: HomeStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> refresh() async {
    getPosts();
  }
}
