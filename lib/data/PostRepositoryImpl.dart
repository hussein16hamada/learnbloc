import 'package:dartz/dartz.dart';

import '../domain/Post.dart';
import '../domain/PostDataSource.dart';
import '../domain/PostRepository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource dataSource;

  PostRepositoryImpl({required this.dataSource});

  @override
  Future<Either<String, List<Post>>> fetchPosts() async {
    try {
      final result = await dataSource.fetchPosts();
      return result;
    } catch (e) {
      return left('Failed to load posts');
    }
  }
}
