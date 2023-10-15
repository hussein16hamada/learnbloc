import 'package:dartz/dartz.dart';

import 'Post.dart';

abstract class PostDataSource {
  Future<Either<String, List<Post>>> fetchPosts();
}
