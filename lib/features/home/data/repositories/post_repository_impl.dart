import 'package:flutter_mvvm_riverpod_boilerplate/features/home/data/datasources/post_remote_data_source.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/features/home/domain/entities/post.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/features/home/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Post>> getPosts() async {
    try {
      return await remoteDataSource.getPosts();
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }
}
