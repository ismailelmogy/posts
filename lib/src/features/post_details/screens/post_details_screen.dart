import 'package:flutter/material.dart';
import 'package:posts/src/core/utils/media_query_values.dart';
import 'package:posts/src/features/posts/domain/entities/post.dart';

class PostDetailsScreen extends StatelessWidget {
  final Post post;
  const PostDetailsScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Post Details"),
      ),
      body: Container(
        width: context.width,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${post.id}. ${post.title}",
              style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(post.body),
            const SizedBox(height: 10.0),
            Text("User Id : ${post.userId}"),
          ],
        ),
      ),
    ));
  }
}
