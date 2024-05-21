import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/consts/vars.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/services/global_methods.dart';
import 'package:news_app/services/utils.dart';
import 'package:news_app/widgets/my_text_content.dart';
import 'package:provider/provider.dart';
import 'package:reading_time/reading_time.dart';
import 'package:share_plus/share_plus.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({
    super.key,
  });

  static const routeName = "/NewsDetailsScreen";

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    final color = Utils(context).getColor;
    final newsProvider = Provider.of<NewsProvider>(context);
    final publishedAt = ModalRoute.of(context)?.settings.arguments.toString();

    final newsModel = newsProvider.findByDate(publishedAt: publishedAt!);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: color),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'By ${newsModel.authorName}',
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
                  newsModel.title,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      GlobalMethods.formattedDateText(newsModel.publishedAt),
                      style: smallTextStyle,
                    ),
                    Text(
                      readingTime(newsModel.content).msg,
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
                      child: Hero(
                        tag: newsModel.publishedAt,
                        child: FancyShimmerImage(
                          width: double.infinity,
                          boxFit: BoxFit.fill,
                          errorWidget:
                              Image.asset('assets/images/empty_image.png'),
                          imageUrl: newsModel.urlToImage,
                        ),
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
                            onTap: () {
                              try {
                                Share.share(newsModel.url);
                              } catch (err) {
                                GlobalMethods.showErrorDialog(
                                  errorMessage: err.toString(),
                                  context: context,
                                );
                              }
                            },
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
                  label: newsModel.description,
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
                  label: newsModel.content,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
