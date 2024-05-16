import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/consts/vars.dart';
import 'package:news_app/services/utils.dart';
import 'package:news_app/widgets/my_text_content.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({super.key});

  static const routeName = "/NewsDetailsScreen";

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final color = Utils(context).getColor;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: color),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'By Author',
          style: TextStyle(
            color: color,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title' * 10,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '16/05/2024',
                      style: smallTextStyle,
                    ),
                    Text(
                      'Reading Time',
                      style: smallTextStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Image and Function Button
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: FancyShimmerImage(
                        width: double.infinity,
                        boxFit: BoxFit.fill,
                        errorWidget: Image.asset('assets/images/empty_image.png'),
                        imageUrl:
                            "https://images.unsplash.com/photo-1715427345776-b3c07159c12f?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 16,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Card(
                              elevation: 10,
                              shape: const CircleBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.bookmark_outline_rounded,
                                  size: 24,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {},
                            child: Card(
                              elevation: 10,
                              shape: const CircleBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.share,
                                  size: 24,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                const MyTextContent(
                  label: 'Description',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 8),
                // Description
                MyTextContent(
                  label: 'Description' * 20,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                const SizedBox(height: 16),
                const MyTextContent(
                  label: 'Contents',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 8),
                // Contents
                MyTextContent(
                  label: 'Contents' * 20,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
