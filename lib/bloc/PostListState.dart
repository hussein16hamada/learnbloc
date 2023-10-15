
import '../domain/Post.dart';

abstract class PostListState {}

class InitialPostListState extends PostListState{}

class SuccessPostListState extends PostListState {
  final List<Post> posts;

  SuccessPostListState(this.posts);
}

class LoadingPostListState extends PostListState {}

class ErrorPostListState extends PostListState {
  final String error;

  ErrorPostListState(this.error);
}
