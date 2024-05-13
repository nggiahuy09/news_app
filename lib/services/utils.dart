import 'package:flutter/material.dart';
import 'package:news_app/consts/vars.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class Utils {
  BuildContext context;
  Utils(this.context);

  bool get getDarkTheme => Provider.of<ThemeProvider>(context).getDarkTheme;
  Color get getColor => getDarkTheme ? Colors.white : Colors.black;

  List<DropdownMenuItem<String>> get getDropDownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem<String>(
        value: SortByEnum.relevancy.name,
        child: const Text(
          'Relevancy',
        ),
      ),
      DropdownMenuItem<String>(
        value: SortByEnum.popularity.name,
        child: const Text(
          'Popularity'
        ),
      ),
      DropdownMenuItem<String>(
        value: SortByEnum.publishedAt.name,
        child: const Text(
          'Published At'
        ),
      ),
    ];
    return menuItems;
  }
}
