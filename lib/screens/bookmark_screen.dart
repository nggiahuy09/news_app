import 'package:flutter/material.dart';
import 'package:news_app/screens/empty_screen.dart';
import 'package:news_app/services/utils.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Bookmarks',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      // body: ListView.builder(
      //   itemCount: 20,
      //   itemBuilder: (context, index) {
      //     return const MyArticlesWidget();
      //   },
      // ),
      body: const EmptyNewsScreen(
        imagePath: 'assets/images/bookmark.png',
        text: 'You didn\'t add anything yet to your bookmarks',
      ),
    );
  }
}
