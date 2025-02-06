import 'package:flutter_mvvm_riverpod_boilerplate/core/network/dio_config.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/core/network/network_client.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/features/home/data/datasources/post_remote_data_source.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/features/home/data/repositories/post_repository_impl.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/features/home/domain/repositories/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'providers.g.dart';

@riverpod
Future<SharedPreferences> sharedPreferences(Ref ref) async {
  return await SharedPreferences.getInstance();
}

@riverpod
NetworkClient networkClient(Ref ref) {
  return NetworkClient(AppDio().getDio());
}

@riverpod
PostRemoteDataSource postRemoteDataSource(Ref ref) {
  final networkClient = ref.watch(networkClientProvider);
  return PostRemoteDataSourceImpl(networkClient: networkClient);
}

@riverpod
PostRepository postRepository(Ref ref) {
  final remoteDataSource = ref.watch(postRemoteDataSourceProvider);
  return PostRepositoryImpl(remoteDataSource: remoteDataSource);
}
