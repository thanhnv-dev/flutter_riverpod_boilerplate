import 'package:flutter_mvvm_riverpod_boilerplate/features/home/domain/entities/post.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  error,
}

class HomeState {
  final HomeStatus status;
  final List<Post> posts;
  final String? errorMessage;

  HomeState({
    this.status = HomeStatus.initial,
    this.posts = const [],
    this.errorMessage,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<Post>? posts,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
