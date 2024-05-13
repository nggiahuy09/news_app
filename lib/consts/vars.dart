import 'package:flutter/material.dart';

enum NewsType {
  topTrending,
  allNews,
}

enum SortByEnum {
  relevancy, // articles more closely related to queue come first
  popularity, // articles from popular sources and publishers come first
  publishedAt, // newest articles come first
}

const defaultButtonPadding = EdgeInsets.fromLTRB(16, 8, 16, 8);
const defaultSmallButtonPadding = EdgeInsets.all(8,);