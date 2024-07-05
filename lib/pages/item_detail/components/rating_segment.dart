import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_cafeteria/pages/item_detail/components/rating_star_indicator.dart';
import 'package:smart_cafeteria/pages/item_detail/components/rating_progress_indicator.dart';

class RatingSegment extends StatelessWidget {
  const RatingSegment({
    super.key,
    required this.rating,
    required this.ratingCount,
    required this.ratingMap,
  });

  final double rating;
  final double ratingCount;
  final Map<double, double> ratingMap;

  @override
  Widget build(BuildContext context) {
    final String formattedRatingCount =
        NumberFormat.decimalPatternDigits().format(ratingCount.toInt());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rating.toString(),
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
                RatingStarIndicator(rating: rating),
                Text(
                  formattedRatingCount,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: Column(
              children: [
                RatingProgressIndicator(
                  index: "5",
                  value: fixedPrecision(ratingMap[5]! / ratingCount),
                ),
                RatingProgressIndicator(
                  index: "4",
                  value: fixedPrecision(ratingMap[4]! / ratingCount),
                ),
                RatingProgressIndicator(
                  index: "3",
                  value: fixedPrecision(ratingMap[3]! / ratingCount),
                ),
                RatingProgressIndicator(
                  index: "2",
                  value: fixedPrecision(ratingMap[2]! / ratingCount),
                ),
                RatingProgressIndicator(
                  index: "1",
                  value: fixedPrecision(ratingMap[1]! / ratingCount),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

double fixedPrecision(double val) {
  return double.parse(val.toStringAsFixed(2));
}
