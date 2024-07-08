import 'dart:math';

import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';

import '../../../model/test_model/item_info.dart';
import '../../item_detail/item_detail.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.item_,
    required this.cardHeight,
  });

  final MyItemInfo item_;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemDetail(item_: item_),
              ),
            );
            // ScaffoldMessenger.of(context).showSnackBar(
            //   const SnackBar(
            //     content: Text(" clicked "),
            //     duration: Duration(milliseconds: 700),
            //   ),
            // );
          },
          borderRadius: BorderRadius.circular(10),
          child: Ink(
            height: cardHeight,
            decoration: BoxDecoration(
              // border: Border.all(color: Theme.of(context).colorScheme.outlineVariant,width: 2),
              borderRadius: BorderRadius.circular(10),
              color: brightness == Brightness.light
                  ? Theme.of(context).colorScheme.primaryFixed.withOpacity(0.8)
                  : Theme.of(context).colorScheme.onPrimaryFixedVariant.withOpacity(0.7),
              // color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(7),
                  child: AspectRatio(
                    aspectRatio: 0.95,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(10),
                        right: Radius.circular(1.5),
                      ),
                      child: Image.asset(
                        item_.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 1, 5, 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item_.name.toCapitalCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          // style: GoogleFonts.poppins(fontSize: 17, color: Theme.of(context).colorScheme.onSecondaryContainer, fontWeight: FontWeight.w500,),
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            item_.itemDetail,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.outline,
                                  // fontSize: 13,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 1),
                        CartItemQuantity(item_: item_),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 2,
          top: 2,
          child: SizedBox(
            height: 25,
            width: 25,
            child: IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("clicked"),
                    duration: Duration(milliseconds: 700),
                  ),
                );
              },
              padding: const EdgeInsets.all(0),
              icon: const Icon(Icons.close),
              iconSize: 22,
            ),
          ),
        ),
      ],
    );
  }
}

class CartItemQuantity extends StatefulWidget {
  const CartItemQuantity({super.key, required this.item_});

  final MyItemInfo item_;

  @override
  State<CartItemQuantity> createState() => _CartItemQuantityState();
}

class _CartItemQuantityState extends State<CartItemQuantity> {
  int quantity = 1;

  void _setQuantity(int val) {
    setState(() {
      quantity += val;
      quantity = max(quantity, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final MyItemInfo item_ = widget.item_;
    const double textSize_ = 18;
    const double iconSize_ = 22;
    const double iconBorderSize_ = iconSize_ + 5;

    return Column(
      children: [
        Row(
          children: [
            Text(
              "Tk. ${int.parse(item_.price) * quantity}",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    // color: Theme.of(context).colorScheme.onSecondaryContainer,
                    color: Theme.of(context).colorScheme.error,
                    fontSize: textSize_ + 3,
                  ),
            ),
            const SizedBox(width: 15),
            Text(
              "${item_.price} x1",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.85),
                    fontSize: textSize_ - 2,
                  ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.local_fire_department_outlined,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    size: textSize_ + 3,
                  ),
                  Text(
                    "${int.parse(item_.kcal) * quantity} cal",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          fontSize: textSize_,
                        ),
                  ),
                ],
              ),
            ),
            //quantity increment decrement
            Padding(
              padding: const EdgeInsets.only(right: 8, bottom: 5),
              child: Row(
                children: [
                  SizedBox(
                    height: iconBorderSize_,
                    width: iconBorderSize_,
                    child: IconButton.filledTonal(
                      onPressed: () {
                        _setQuantity(-1);
                      },
                      padding: const EdgeInsets.all(0),
                      style: IconButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.tertiaryContainer,
                      ),
                      icon: Icon(
                        Icons.remove_sharp,
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                      iconSize: iconSize_,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: Text(
                      "$quantity",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            fontSize: textSize_,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: iconBorderSize_,
                    width: iconBorderSize_,
                    child: IconButton.filledTonal(
                      onPressed: () {
                        _setQuantity(1);
                      },
                      padding: const EdgeInsets.all(0),
                      style: IconButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.tertiaryContainer,
                      ),
                      icon: Icon(
                        Icons.add_sharp,
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                      iconSize: iconSize_,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
