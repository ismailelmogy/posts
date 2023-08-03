import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/post.dart';
import '../../domain/usecases/get_posts.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetPosts getPosts;
  PostsBloc({required this.getPosts}) : super(PostsInitial()) {
    on<GetPostsEvent>(_getPosts);
  }

  bool isLoading = false;
  int pageNo = 1, totalPages = 10;
  List<Post> posts = [];
  Future<void> _getPosts(
    GetPostsEvent event,
    Emitter<PostsState> emit,
  ) async {
    if (state is PostsIsLoading) return;
    isLoading = true;
    emit(PostsIsLoading(isFirstFetch: pageNo == 1));
    Either<Failure, List<Post>> response =
        await getPosts.call(GetPostsParams(pageNo: pageNo));
    emit(response.fold((failure) => PostsError(message: failure.message),
        (newPosts) {
      pageNo++;
      posts.addAll(newPosts);
      return PostsLoaded();
    }));
  }
}
