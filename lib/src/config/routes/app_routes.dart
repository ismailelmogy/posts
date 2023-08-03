import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/src/features/posts/presentation/bloc/posts_bloc.dart';
import '../../core/utils/app_strings.dart';
import '../../features/posts/presentation/screens/home_screen.dart';
import 'package:posts/src/injection_container.dart' as di;

class Routes {
  static const String mainRoute = '/';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => di.serviceLocator<PostsBloc>(),
                child: const HomeScreen()));

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
