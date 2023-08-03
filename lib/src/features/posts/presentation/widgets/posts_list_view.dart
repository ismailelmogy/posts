import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/src/core/widgets/error_widget.dart' as error_widget;
import 'package:posts/src/features/posts/presentation/bloc/posts_bloc.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../core/widgets/no_data.dart';
import 'post_widget.dart';

class PostsListView extends StatefulWidget {
  const PostsListView({super.key});

  @override
  State<PostsListView> createState() => _PostsListViewState();
}

class _PostsListViewState extends State<PostsListView>
    with TickerProviderStateMixin {
  final _scrollController = ScrollController();
  AnimationController? _animationController;
  late PostsBloc _postsBloc;
  bool _isLoading = false;

  _getPosts() => _postsBloc.add(GetPostsEvent());

  void _setupScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
              _scrollController.position.pixels &&
          _postsBloc.pageNo <= _postsBloc.totalPages) {
        _getPosts();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _postsBloc = BlocProvider.of<PostsBloc>(context);
    _setupScrollController();
    _getPosts();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
      if (state is PostsIsLoading && state.isFirstFetch) {
        return const LoadingIndicator();
      } else if (state is PostsIsLoading) {
        _isLoading = true;
      } else if (state is PostsError) {
        return error_widget.ErrorWidget(
            msg: state.message!, onRetryPressed: () => _getPosts());
      }
      return _postsBloc.posts.isNotEmpty
          ? ListView.separated(
              controller: _scrollController,
              itemCount: _postsBloc.posts.length + (_isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                var count = _postsBloc.posts.length + (_isLoading ? 1 : 0);
                final Animation<double> animation =
                    Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: _animationController!,
                    curve: Interval((1 / count) * index, 1.0,
                        curve: Curves.fastOutSlowIn),
                  ),
                );
                _animationController?.forward();
                if (index < _postsBloc.posts.length) {
                  return PostWidget(
                    post: _postsBloc.posts[index],
                    animation: animation,
                    animationController: _animationController,
                  );
                } else if (_postsBloc.pageNo <= _postsBloc.totalPages) {
                  Timer(const Duration(milliseconds: 30), () {
                    _scrollController
                        .jumpTo(_scrollController.position.maxScrollExtent);
                  });
                  return const LoadingIndicator();
                }
                return const SizedBox();
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey[400],
                );
              },
            )
          : const NoData();
    });
  }
}
