import 'package:flutter/material.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class Utils {
  BuildContext context;
  Utils(this.context);

  bool get getDarkTheme => Provider.of<ThemeProvider>(context).getDarkTheme;
  Color get getColor => getDarkTheme ? Colors.white : Colors.black;
}
