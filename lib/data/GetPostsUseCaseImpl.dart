import 'package:dartz/dartz.dart';

import '../domain/GetPostsUseCase.dart';
import '../domain/Post.dart';
import '../domain/PostRepository.dart';

class GetPostsUseCaseImpl implements GetPostsUseCase {
  final PostRepository repository;

  GetPostsUseCaseImpl({required this.repository});

  @override
  Future<Either<String, List<Post>>> execute() async {
    return await repository.fetchPosts();
  }
}
