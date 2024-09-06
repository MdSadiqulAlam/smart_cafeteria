import 'package:flutter/material.dart';

import '../../model/test/item_model.dart';
import 'components/cart_item_card.dart';
import 'components/checkout_segment.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 14,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(12, 3, 12, 2),
            // physics: const BouncingScrollPhysics(),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              // itemCount: allItems.length,
              itemCount: 7,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, int index) {
                ItemModel item_ = allItems[index % allItems.length];
                return CartItemCard(item_: item_);
              },
            ),
          ),
        ),
        const Expanded(flex: 1, child: CheckoutSegment()),
      ],
    );
  }
}
