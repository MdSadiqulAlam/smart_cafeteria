import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/cart/components/cart_controller.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display_controller.dart';
import 'package:smart_cafeteria/pages/payment/checkout_bottom_sheet.dart';

class CheckoutSegment extends StatelessWidget {
  const CheckoutSegment({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    const double textSize_ = 18;

    return Obx(
      () {
        // Check if the cart is empty
        if (cartController.cartItems.isEmpty) {
          return const SizedBox.shrink();
        }
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 7),
          decoration: BoxDecoration(
            border: Border.symmetric(horizontal: BorderSide(color: getColorScheme(context).outline, width: 0.5)),
            color: getColorScheme(context).secondaryContainer,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                // color: Colors.red,
                padding: const EdgeInsets.only(bottom: 7),
                child: Row(
                  children: [
                    Icon(
                      Icons.local_fire_department_outlined,
                      color: getColorScheme(context).onSecondaryContainer,
                      size: textSize_ + 3,
                    ),
                    Text(
                      '${cartController.getTotalCalories()} Cal',
                      style: getTextTheme(context).labelLarge?.copyWith(
                            color: getColorScheme(context).onSecondaryContainer,
                            fontSize: textSize_,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                // color: Colors.yellowAccent,
                padding: const EdgeInsets.only(bottom: 7),
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: "Total: ",
                      style: getTextTheme(context).labelLarge?.copyWith(
                            color: getColorScheme(context).onSecondaryContainer,
                            fontSize: textSize_,
                          ),
                    ),
                    TextSpan(
                      text: "${cartController.getTotalPrice()} Tk.",
                      style: getTextTheme(context).labelLarge?.copyWith(
                            // color: Theme.of(context).colorScheme.onSecondaryContainer,
                            color: getColorScheme(context).error,
                            fontSize: textSize_ + 3,
                          ),
                    ),
                  ]),
                ),
              ),
              FilledButton(
                onPressed: () => checkoutBottomSheet(context: context, totalPrice: cartController.getTotalPrice()),
                style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 17)),
                child: Text(
                  "CheckOut (${ItemDisplayController.instance.getTotalItemCount})",
                  style: const TextStyle(fontSize: textSize_ - 2),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
