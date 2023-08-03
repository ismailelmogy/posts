import 'package:posts/src/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:posts/src/features/posts/presentation/bloc/posts_bloc.dart';

import '../../injection_container.dart';
import 'data/repositories/posts_repository_impl.dart';
import 'domain/repositories/posts_repository.dart';
import 'domain/usecases/get_posts.dart';

void initPostsFeature() {
// Blocs
  serviceLocator.registerFactory<PostsBloc>(() => PostsBloc(
        getPosts: serviceLocator(),
      ));

  // Use cases
  serviceLocator.registerLazySingleton<GetPosts>(
      () => GetPosts(postsRepository: serviceLocator()));

  // Repository
  serviceLocator.registerLazySingleton<PostsRepository>(
      () => PostsRepositoryImpl(postsRemoteDataSource: serviceLocator()));

  // Data sources
  serviceLocator.registerLazySingleton<PostsRemoteDataSource>(
      () => PostsRemoteDataSourceImpl(apiConsumer: serviceLocator()));
}
