import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/blog_details.dart';
import 'package:news_app/screens/news_details_webview.dart';
import 'package:news_app/services/utils.dart';
import 'package:page_transition/page_transition.dart';

class TopTrendingWidget extends StatelessWidget {
  const TopTrendingWidget({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(NewsDetailsScreen.routeName);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                width: double.infinity,
                height: size.height * 0.48,
                boxFit: BoxFit.fill,
                errorWidget: Image.asset('assets/images/empty_image.png'),
                imageUrl:
                    "https://images.unsplash.com/photo-1715427345776-b3c07159c12f?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Title',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      PageTransition(
                        child: NewsDetailsWebviewScreen(
                          url: url,
                        ),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.link,
                        size: 24,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Link',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
                const SelectableText(
                  '14/05/2024',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
