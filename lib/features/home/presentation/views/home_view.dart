import 'package:flutter/material.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/features/home/presentation/viewModels/home_state.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/features/home/presentation/viewModels/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    final viewModel = ref.read(homeViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: viewModel.refresh,
          ),
        ],
      ),
      body: _buildBody(context, state, viewModel),
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
                state.errorMessage ?? 'Something went wrong!',
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => viewModel.refresh(),
                child: const Text('Try again'),
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
