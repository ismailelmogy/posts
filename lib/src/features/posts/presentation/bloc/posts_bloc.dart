import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/post.dart';
import '../../domain/usecases/get_posts.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetPosts getPosts;
  PostsBloc({required this.getPosts}) : super(PostsInitial()) {
    on<GetPostsEvent>(_getPosts);
  }

  int pageNo = 1, totalPages = 10;
  List<Post> posts = [];

  Future<void> _getPosts(
    GetPostsEvent event,
    Emitter<PostsState> emit,
  ) async {
    if (state is PostsIsLoading) return;
    emit(PostsIsLoading(isFirstFetch: pageNo == 1));
    final response = await getPosts.call(GetPostsParams(pageNo: pageNo));
    emit(response.fold((failure) => PostsError(message: failure.message),
        (newPosts) {
      pageNo++;
      posts.addAll(newPosts);
      return PostsLoaded();
    }));
  }
}
