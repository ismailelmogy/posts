import 'package:flutter/material.dart';
import '../widgets/custom_search_delegate.dart';
import '../widgets/posts_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Posts"), actions: [
        IconButton(
          onPressed: () =>
              showSearch(context: context, delegate: CustomSearchDelegate()),
          icon: const Icon(Icons.search),
        )
      ]),
      body: const PostsListView(),
    ));
  }
}
