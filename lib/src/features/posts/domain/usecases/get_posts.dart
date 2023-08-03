import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/post.dart';
import '../repositories/posts_repository.dart';

class GetPosts implements UseCase<List<Post>, GetPostsParams> {
  final PostsRepository postsRepository;
  GetPosts({required this.postsRepository});

  @override
  Future<Either<Failure, List<Post>>> call(
          GetPostsParams getPostsParams) async =>
      await postsRepository.getPosts(pageNo: getPostsParams.pageNo);
}

class GetPostsParams extends Equatable {
  final int pageNo;

  const GetPostsParams({
    required this.pageNo,
  });

  @override
  List<Object?> get props => [pageNo];
}
