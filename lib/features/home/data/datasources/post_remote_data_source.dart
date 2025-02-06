import 'package:dio/dio.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/core/network/network_client.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/features/home/domain/entities/post.dart';

abstract class PostRemoteDataSource {
  Future<List<Post>> getPosts();
}

class PostException implements Exception {
  final String message;
  final int? statusCode;

  PostException(this.message, {this.statusCode});

  @override
  String toString() => 'PostException: $message${statusCode != null ? ' (Status: $statusCode)' : ''}';
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final NetworkClient networkClient;

  PostRemoteDataSourceImpl({required this.networkClient});

  @override
  Future<List<Post>> getPosts() async {
    try {
      final response = await networkClient.getPosts();

      final List<dynamic> jsonList = response;
      return jsonList.map((json) => Post.fromJson(json)).toList();
    } on DioException catch (e) {
      throw PostException('Network error: ${e.message}', statusCode: e.response?.statusCode);
    } catch (e) {
      throw PostException('Unexpected error: $e');
    }
  }
}
