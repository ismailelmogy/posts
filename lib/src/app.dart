import 'package:flutter/material.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';

class PostsApp extends StatefulWidget {
  const PostsApp({
    Key? key,
  }) : super(key: key);
  @override
  State<PostsApp> createState() => _PostsAppState();
}

class _PostsAppState extends State<PostsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: appTheme(),
    );
  }
}
