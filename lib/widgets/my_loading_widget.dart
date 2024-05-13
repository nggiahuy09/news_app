import 'package:flutter/material.dart';
import 'package:news_app/services/utils.dart';
import 'package:shimmer/shimmer.dart';

class MyLoadingWidget extends StatefulWidget {
  const MyLoadingWidget({super.key});

  @override
  State<MyLoadingWidget> createState() => _MyLoadingWidget();
}

class _MyLoadingWidget extends State<MyLoadingWidget> {
  BorderRadius borderRadius = BorderRadius.circular(16);
  late Color baseShimmerColor, highlightShimmerColor, widgetShimmerColor;

  @override
  void didChangeDependencies() {
    var utils = Utils(context);
    baseShimmerColor = utils.getBaseShimmerColor;
    highlightShimmerColor = utils.getHighlightShimmerColor;
    widgetShimmerColor = utils.getWidgetShimmerColor;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;

    return Container(
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
      child: Shimmer.fromColors(
        baseColor: baseShimmerColor,
        highlightColor: highlightShimmerColor,
        direction: ShimmerDirection.ltr,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: size.width * 0.28,
                height: size.height * 0.14,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: widgetShimmerColor,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: borderRadius,
                      color: widgetShimmerColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: size.height * 0.02,
                    width: size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: borderRadius,
                      color: widgetShimmerColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: size.height * 0.02,
                        width: size.width * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: borderRadius,
                          color: widgetShimmerColor,
                        ),
                      ),
                      Container(
                        height: size.height * 0.02,
                        width: size.width * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: borderRadius,
                          color: widgetShimmerColor,
                        ),
                      ),
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
