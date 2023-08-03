import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/src/features/posts/domain/entities/post.dart';
import 'package:posts/src/features/posts/presentation/bloc/posts_bloc.dart';
import '../../../../config/routes/app_routes.dart';

class CustomSearchDelegate extends SearchDelegate {
// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<Post> matchQuery = [];
    for (var post in context.read<PostsBloc>().posts) {
      if (post.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(post);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result.title),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<Post> matchQuery = [];
    for (var post in context.read<PostsBloc>().posts) {
      if (post.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(post);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
            title: Text(result.title),
            onTap: () => Navigator.pushNamed(context, Routes.postDetailsRoute,
                arguments: result));
      },
    );
  }
}
