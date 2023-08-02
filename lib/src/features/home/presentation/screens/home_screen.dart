import 'package:flutter/material.dart';
import 'package:posts/src/core/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Card(
          shadowColor: AppColors.darkGrey,
          child: Column(
            children: [
              Text("dolorum ut in voluptas mollitia et saepe quo animi")
            ],
          ),
        ),
      ),
    );
  }
}
