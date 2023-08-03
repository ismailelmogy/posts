part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object?> get props => [];
}

class PostsInitial extends PostsState {}

class PostsIsLoading extends PostsState {
  final bool isFirstFetch;
  const PostsIsLoading({required this.isFirstFetch});
  @override
  List<Object?> get props => [isFirstFetch];
}

class PostsLoaded extends PostsState {}

class PostsError extends PostsState {
  final String? message;
  const PostsError({this.message});
  @override
  List<Object?> get props => [message];
}
