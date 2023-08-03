import 'package:flutter/material.dart';
import 'package:posts/src/features/post_details/screens/post_details_screen.dart';
import 'package:posts/src/features/posts/domain/entities/post.dart';
import '../../core/utils/app_strings.dart';
import '../../features/posts/presentation/screens/home_screen.dart';

class Routes {
  static const String mainRoute = '/';
  static const String postDetailsRoute = '/postDetails';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.postDetailsRoute:
        var post = args as Post;
        return MaterialPageRoute(
            builder: (_) => PostDetailsScreen(
                  post: post,
                ));

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
