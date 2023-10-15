import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'PostListScreen.dart';
import 'bloc/PostListBloc.dart';
import 'data/GetPostsUseCaseImpl.dart';
import 'data/PostRemoteDataSource.dart';
import 'data/PostRepositoryImpl.dart';
import 'domain/PostRepository.dart';
import 'domain/PostDataSource.dart';
import 'domain/GetPostsUseCase.dart';

void main() {
  final getIt = GetIt.I;

  // Register Dio for making network requests
  getIt.registerSingleton<Dio>(Dio());

  // Register the data source for fetching posts
  getIt.registerFactory<PostDataSource>(() => PostRemoteDataSource(dio: getIt<Dio>()));

  // Register the repository for managing posts
  getIt.registerFactory<PostRepository>(() => PostRepositoryImpl(dataSource: getIt<PostDataSource>()));

  // Register the use case for getting posts
  getIt.registerFactory<GetPostsUseCase>(() => GetPostsUseCaseImpl(repository: getIt<PostRepository>()));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => PostListBloc(getPostsUseCase: GetIt.I<GetPostsUseCase>()), // Use GetIt to get the GetPostsUseCase
        child: PostListScreen(),
      ),
    );
  }
}
