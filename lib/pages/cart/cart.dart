import 'package:flutter/material.dart';
import '../../model/test_model/item_info.dart';
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
          flex: 13,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(12, 3, 12, 2),
            // physics: const BouncingScrollPhysics(),
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(1.2, 0, 1.2, 15),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: allItems.length,
                separatorBuilder: (_, __) => const SizedBox(height: 20),
                itemBuilder: (_, int index) {
                  final double cardHeight =
                      const Size.fromHeight(kToolbarHeight).height * 2;
                  MyItemInfo item_ = allItems[index % allItems.length];
                  // const double textSize_ = 14;

                  return CartItemCard(item_: item_, cardHeight: cardHeight);
                },
              ),
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          // child: Container(
          //   padding: const EdgeInsets.only(bottom: 5),
          //   color: Colors.grey.withOpacity(0  ),
          //   child: FilledButton(
          //     onPressed: () {},
          //     child: SizedBox(width:MediaQuery.of(context).size.width*0.8,child: Text("nai")),
          //   ),
          // ),
          child: CheckoutSegment(),
        ),
      ],
    );
  }
}

