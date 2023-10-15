import 'package:dartz/dartz.dart';

import 'Post.dart';

abstract class PostRepository {
  Future<Either<String, List<Post>>> fetchPosts();
}

