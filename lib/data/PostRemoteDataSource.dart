import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../domain/Post.dart';
import '../domain/PostDataSource.dart';

class PostRemoteDataSource implements PostDataSource {
  final Dio dio;

  PostRemoteDataSource({required this.dio});

  @override
  Future<Either<String, List<Post>>> fetchPosts() async {
    try {
      final response = await dio.get('https://jsonplaceholder.typicode.com/posts');

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;
        final posts = jsonList.map((json) => Post.fromJson(json)).toList();
        return right(posts);
      } else {
        return left('Failed to load posts');
      }
    } catch (e) {
      return left('Failed to load posts');
    }
  }
}
