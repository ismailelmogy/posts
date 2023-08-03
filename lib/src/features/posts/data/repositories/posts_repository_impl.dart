import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:posts/src/core/utils/app_strings.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/posts_repository.dart';
import '../datasources/posts_remote_data_source.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostsRemoteDataSource postsRemoteDataSource;
  PostsRepositoryImpl({required this.postsRemoteDataSource});
  @override
  Future<Either<Failure, List<Post>>> getPosts({required int pageNo}) async {
    try {
      final response = await postsRemoteDataSource.getPosts(pageNo: pageNo);
      return Right(response);
    } on NoInternetConnectionException catch (_) {
      return const Left(
          ServerFailure(message: AppStrings.noInternetConnection));
    } on InternalServerErrorException {
      return const Left(ServerFailure(message: AppStrings.internalServerError));
    } on FormatException {
      return const Left(
          ServerFailure(message: AppStrings.errorOccurredDuringReadingData));
    } catch (exception) {
      return const Left(ServerFailure(message: AppStrings.somethingWentWrong));
    }
  }
}
