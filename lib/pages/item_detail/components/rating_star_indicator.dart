import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStarIndicator extends StatelessWidget {
  const RatingStarIndicator({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 15,
      itemBuilder: (_, __) {
        return const Icon(Icons.star_rounded);
      },
    );
  }
}
