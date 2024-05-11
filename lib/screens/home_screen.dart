import 'package:flutter/material.dart';
import 'package:news_app/consts/global_colors.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: SwitchListTile(
          title: Text(
            themeProvider.getDarkTheme ? 'Dark' : 'Light',
            style: TextStyle(
                color:
                    themeProvider.getDarkTheme ? darkTextColor : lightTextColor),
          ),
          secondary: Icon(
            themeProvider.getDarkTheme ? Icons.dark_mode : Icons.light_mode,
            color: Theme.of(context).colorScheme.secondary,
          ),
          value: themeProvider.getDarkTheme,
          onChanged: (bool value) {
            setState(() {
              themeProvider.setDarkTheme = value;
            });
          },
        ),
      ),
    );
  }
}
