import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/model/item_model.dart';
import 'package:smart_cafeteria/pages/cart/components/cart_controller.dart';
import 'package:smart_cafeteria/pages/cart/components/cart_item_card.dart';
import 'package:smart_cafeteria/pages/cart/components/checkout_segment.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Column(
      children: [
        const SizedBox(height: 3),
        Expanded(
          flex: 13,
          child: Obx(() {
            if (cartController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (cartController.cartItems.isEmpty) {
              return Center(child: Text("Your cart is empty", style: getTextTheme(context).bodyLarge));
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(12, 3, 12, 2),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cartController.cartItems.length,
                // Update to use dynamic item count
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (_, int index) {
                  ItemModel item = cartController.cartItems[index]; // Use items from cartController
                  return CartItemCard(item_: item);
                },
              ),
            );
          }),
        ),
        const Expanded(flex: 1, child: CheckoutSegment()),
      ],
    );
  }
}
