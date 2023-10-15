import 'package:dartz/dartz.dart';

import 'Post.dart';

abstract class GetPostsUseCase {
  Future<Either<String, List<Post>>> execute();
}
