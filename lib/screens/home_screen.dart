import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/consts/vars.dart';
import 'package:news_app/widgets/my_drawer.dart';
import 'package:news_app/widgets/my_tabs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var newsType = NewsType.allNews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
        title: const Text('News App'),
      ),
      drawer: const MyDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                MyTabWidget(
                  text: 'All News',
                  onTap: () {
                    if (newsType == NewsType.allNews) {
                      return;
                    } else {
                      setState(() {
                        newsType = NewsType.allNews;
                      });
                    }
                  },
                  isSelected: newsType == NewsType.allNews,
                ),
                const SizedBox(width: 8),
                MyTabWidget(
                  text: 'Top Trending',
                  onTap: () {
                    if (newsType == NewsType.topTrending) {
                      return;
                    } else {
                      setState(() {
                        newsType = NewsType.topTrending;
                      });
                    }
                  },
                  isSelected: newsType == NewsType.topTrending,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
