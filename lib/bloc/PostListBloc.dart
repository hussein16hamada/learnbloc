import 'package:bloc/bloc.dart';
import 'package:learnbloc/bloc/PostListEvent.dart';
import 'package:learnbloc/bloc/PostListState.dart';
import '../domain/GetPostsUseCase.dart';

class PostListBloc extends Bloc<PostListEvent, PostListState> {
  final GetPostsUseCase getPostsUseCase;

  PostListBloc({required this.getPostsUseCase}) : super(InitialPostListState()) {
    on<FetchPostsEvent>(_onFetchPosts);

  }
  void _onFetchPosts(FetchPostsEvent event, Emitter<PostListState> emit) async {
    emit(LoadingPostListState());
    final result = await getPostsUseCase.execute();
    emit(result.fold(
          (error) => ErrorPostListState(error),
          (posts) => SuccessPostListState(posts),
    ));
  }
}
