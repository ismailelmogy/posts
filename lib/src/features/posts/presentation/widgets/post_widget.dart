import 'package:flutter/material.dart';
import 'package:posts/src/core/utils/media_query_values.dart';
import 'package:posts/src/features/posts/domain/entities/post.dart';

class PostWidget extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final Post post;
  const PostWidget(
      {super.key,
      this.animationController,
      this.animation,
      required this.post});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
              transform: Matrix4.translationValues(
                  0.0, 50 * (1.0 - animation!.value), 0.0),
              child: Container(
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
                    Text(post.body.length > 100
                        ? '${post.body.substring(0, 100)}...'
                        : post.body)
                  ],
                ),
              )),
        );
      },
    );
  }
}
