import 'package:flutter/material.dart';

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator(
      {super.key, required this.index, required this.value});

  final String index;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            index,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Expanded(
          flex: 11,
          child: LinearProgressIndicator(
            value: value,
            minHeight: 10,
            backgroundColor: Theme.of(context).colorScheme.outlineVariant,
            borderRadius: BorderRadius.circular(7),
            // valueColor:
            //     AlwaysStoppedAnimation(Theme.of(context).colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
