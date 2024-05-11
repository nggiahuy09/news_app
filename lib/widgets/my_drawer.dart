import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/widgets/my_list_tile.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Drawer(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/newspaper.png',
                    width: 90,
                    height: 90,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'News App',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        MyListTile(
                          title: 'Home',
                          icon: IconlyBold.home,
                          onTap: () {},
                        ),
                        MyListTile(
                          title: 'Bookmarks',
                          icon: IconlyBold.bookmark,
                          onTap: () {},
                        ),
                      ],
                    ),
                    SwitchListTile(
                      title: Text(
                        themeProvider.getDarkTheme ? 'Dark' : 'Light',
                        style: TextStyle(
                          color:
                              Theme.of(context).textSelectionTheme.cursorColor,
                        ),
                      ),
                      secondary: Icon(
                        themeProvider.getDarkTheme
                            ? Icons.dark_mode
                            : Icons.light_mode,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      value: themeProvider.getDarkTheme,
                      onChanged: (bool value) {
                        setState(() {
                          themeProvider.setDarkTheme = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
