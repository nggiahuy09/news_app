import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/consts/vars.dart';
import 'package:news_app/screens/news_details_webview.dart';
import 'package:news_app/services/utils.dart';
import 'package:page_transition/page_transition.dart';

class MyArticlesWidget extends StatelessWidget {
  const MyArticlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;

    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 8,
          left: 16,
          right: 16,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.only(
          left: 8.0,
          top: 8.0,
          bottom: 8.0,
          right: 12.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                width: size.width * 0.28,
                height: size.height * 0.14,
                boxFit: BoxFit.fill,
                imageUrl:
                    "https://images.unsplash.com/photo-1715427345776-b3c07159c12f?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title' * 20,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: smallTextStyle,
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(
                        Icons.timer,
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      Text('Reading Time'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                                PageTransition(
                                  child: const NewsDetailsWebviewScreen(),
                                  type: PageTransitionType.rightToLeft,
                                ),
                              );
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.link,
                              color: Colors.blue,
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Link',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text('13/05/2025 17:10PM'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
