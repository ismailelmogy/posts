import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commons.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/utils/constants.dart';
import '../models/post_model.dart';

abstract class PostsRemoteDataSource {
  Future<List<PostModel>> getPosts({required int pageNo});
}

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  final ApiConsumer apiConsumer;
  PostsRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<PostModel>> getPosts({required int pageNo}) async {
    final response = await apiConsumer.get(EndPoints.posts, queryParameters: {
      AppStrings.pageNumber: pageNo,
      AppStrings.pageSize: fetchLimit,
    });
    final jsonResponse = Commons.decodeJson(response);
    Iterable iterable = jsonResponse;
    var posts = iterable.map((model) => PostModel.fromJson(model)).toList();
    return posts;
  }
}
