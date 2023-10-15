import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/bloc/PostListEvent.dart';
import 'package:learnbloc/bloc/PostListState.dart';

import 'bloc/PostListBloc.dart';
import 'domain/Post.dart';

class PostListScreen extends StatefulWidget {
  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger the API call once the screen is initialized
    context.read<PostListBloc>().add(FetchPostsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post List'),
      ),
      body: BlocBuilder<PostListBloc, PostListState>(
        builder: (context, state) {
          if (state is LoadingPostListState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SuccessPostListState) {
            final posts = state.posts;
            return _buildPostList(posts);
          } else if (state is ErrorPostListState) {
            return Center(
              child: Text('Error: ${state.error}'),
            );
          } else {
            return Center(child: Text('Unknown State'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PostListBloc>().add(FetchPostsEvent());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildPostList(List<Post> posts) {
    if (posts.isEmpty) {
      return Center(child: Text('No posts available.'));
    } else {
      return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(posts[index].title),
            subtitle: Text(posts[index].body),
          );
        },
      );
    }
  }
}
