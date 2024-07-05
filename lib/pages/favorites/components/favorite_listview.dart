import 'package:flutter/material.dart';

class FavoriteListview extends StatefulWidget {
  const FavoriteListview({super.key});

  @override
  State<FavoriteListview> createState() => _FavoriteListviewState();
}

class _FavoriteListviewState extends State<FavoriteListview> {
  final double cardHeight = const Size.fromHeight(kToolbarHeight).height * 2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        // scrollDirection: Axis.vertical,
        itemCount: 15,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 3,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          // return Text("data");
          return InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(" Item clicked"),
                  duration: Duration(milliseconds: 700),
                ),
              );
            },
            borderRadius: BorderRadius.circular(12),
            child: Ink(
              height: cardHeight,
              decoration: BoxDecoration(
                // border: Border.all(color: Theme.of(context).colorScheme.outlineVariant,width: 2),
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Chicken Fry $index'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
