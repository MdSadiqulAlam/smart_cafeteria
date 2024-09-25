import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display/item_display_controller.dart';

import '../../../components/loading_widgets.dart';
import '../../root_page.dart';

class AddToCartSegment extends StatelessWidget {
  final String itemId;

  AddToCartSegment({super.key, required this.itemId});

  final itemCount = 1.obs;
  final addingToCart = false.obs;

  final itemDisplayController = ItemDisplayController.instance;

  void _updateItemCount(int val) {
    itemCount.value += val;
    itemCount.value = itemCount.value < 1 ? 1 : itemCount.value;
  }

  void _addToCart() async {
    if (!addingToCart.value) {
      addingToCart.value = true;
      try {
        /// add to cart
        await itemDisplayController.addItemToCart(itemId, itemCount.value);

        /// snack bar
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: const Text("Item added to cart"),
            duration: const Duration(milliseconds: 3000),
            action: SnackBarAction(
              label: 'Go to Cart',
              textColor: getColorScheme(Get.context!).onPrimaryContainer,
              backgroundColor: getColorScheme(Get.context!).primaryContainer,
              onPressed: () {
                if (Get.currentRoute == '/RootPage') {
                  Get.offAll(() => const RootPage(initialPage: 2));
                } else {
                  Get.to(() => const RootPage(initialPage: 2));
                }
              },
            ),
          ),
        );
      } catch (e) {
        MyLoadingWidgets.errorSnackBar(title: 'Failed to add into cart', message: 'Error: $e');
      } finally {
        addingToCart.value = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17),
      child: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: addingToCart.value
              ? FilledButton.tonal(
                  key: const ValueKey<bool>(true),
                  onPressed: _addToCart,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                    child: LoadingAnimationWidget.fourRotatingDots(
                      color: getColorScheme(context).onSecondaryContainer,
                      size: 29,
                    ),
                  ),
                )
              : Row(
                  key: const ValueKey<bool>(false),
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _updateItemCount(1);
                      },
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              _updateItemCount(-1);
                            },
                          ),
                          Text("$itemCount", style: const TextStyle(fontSize: 20)),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              _updateItemCount(1);
                            },
                          ),
                        ],
                      ),
                    ),
                    FilledButton.tonal(
                      onPressed: _addToCart,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                        child: Text("Add To Cart", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
