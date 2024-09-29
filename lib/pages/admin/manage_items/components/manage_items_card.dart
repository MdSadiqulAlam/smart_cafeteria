import 'package:cached_network_image/cached_network_image.dart';
import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/model/item_model.dart';
import 'package:smart_cafeteria/pages/admin/edit_item/edit_Item.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/model/item_data.dart';
import 'package:smart_cafeteria/utilities/network_manager.dart';
import 'package:smart_cafeteria/pages/admin/manage_items/components/manage_items_controller.dart';

class ManageItemsCardAdmin extends StatelessWidget {
  const ManageItemsCardAdmin({super.key, required this.item_});

  final ItemModel item_;

  @override
  Widget build(BuildContext context) {
    /// quantity Rx variable
    var quantity_ = item_.quantity.obs;

    // Ensure ratingCount is not null or zero
    final num ratingCount = item_.ratingCount == 0 ? 1 : item_.ratingCount;

    // Ensure ratingMap is not null and provide default values for missing keys
    final Map<num, num> ratingMap = {
      1: item_.ratingMap[1] ?? 0,
      2: item_.ratingMap[2] ?? 0,
      3: item_.ratingMap[3] ?? 0,
      4: item_.ratingMap[4] ?? 0,
      5: item_.ratingMap[5] ?? 0,
    };

    // Calculate rating, ensuring no division by zero
    final num rating = fixedPrecision(
        (5 * ratingMap[5]! + 4 * ratingMap[4]! + 3 * ratingMap[3]! + 2 * ratingMap[2]! + 1 * ratingMap[1]!) / ratingCount);
    return InkWell(
      onTap: () => Get.to(() => EditItem(item_: item_)),
      // splashColor: Theme.of(context).colorScheme.secondaryFixedDim,
      // radius: 50,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Ink(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: getColorScheme(context).secondaryContainer),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// image
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: item_.imagePath,
                        placeholder: (context, url) => Center(
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: LoadingAnimationWidget.stretchedDots(color: getColorScheme(context).onSurface, size: 30),
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                /// name
                Padding(
                  padding: const EdgeInsets.only(left: 7, right: 1.5),
                  child: Text(
                    item_.name.toCapitalCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    // style: GoogleFonts.poppins(fontSize: 17, color: Theme.of(context).colorScheme.onSecondaryContainer, fontWeight: FontWeight.w500,),
                    style: getTextTheme(context).headlineSmall?.copyWith(
                          color: getColorScheme(context).onSecondaryContainer,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),

                /// rating and sold
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RatingBarIndicator(
                        itemCount: 1,
                        rating: fixedPrecision(rating / 5),
                        itemSize: 20,
                        unratedColor: Colors.white,
                        itemBuilder: (_, __) => Icon(Icons.star_sharp, color: Colors.amber.shade700),
                      ),
                      Text(
                        "$rating  | sold:${item_.itemSold}",
                        style: getTextTheme(context).labelLarge?.copyWith(color: getColorScheme(context).onSecondaryContainer),
                      ),
                    ],
                  ),
                ),

                /// price
                const SizedBox(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Text(
                    "TK. ${item_.price}",
                    style: getTextTheme(context).titleSmall?.copyWith(
                          color: getColorScheme(context).onSecondaryContainer,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),

            /// edit button
            Positioned(
              top: 8,
              right: 7,
              child: SizedBox(
                height: 33,
                width: 33,
                child: IconButton.filledTonal(
                  color: getColorScheme(context).tertiaryContainer,
                  onPressed: () => Get.to(() => EditItem(item_: item_)),
                  tooltip: "Add To Favorites",
                  style: IconButton.styleFrom(padding: const EdgeInsets.all(0)),
                  icon: Icon(Icons.edit, color: getColorScheme(context).onTertiaryContainer, size: 20),
                ),
              ),
            ),

            /// Quantity status button
            Positioned(
              bottom: 7,
              right: 5,
              child: Obx(() => InkWell(
                    onTap: () {
                      _showQuantityDialog(context, quantity_);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        // color: getColorScheme(context).primary.withOpacity(0.8),
                        color: getColorScheme(context).primary.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.inventory_2, size: 15, color: getColorScheme(context).onPrimary),
                          const SizedBox(width: 5),
                          Text('${quantity_.value}', style: TextStyle(color: getColorScheme(context).onPrimary)),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void _showQuantityDialog(BuildContext context, RxInt quantity_) {
    final TextEditingController quantityController = TextEditingController(text: quantity_.value.toString());

    Get.dialog(
      AlertDialog(
        title: const Text('Update Quantity'),
        content: TextField(
          controller: quantityController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Quantity'),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              try {
                Get.back();
                MyLoadingWidgets.loadingDialogue();

                // Check internet connection
                final isConnected = await NetworkManager.instance.isConnected();
                if (!isConnected) {
                  Get.back();
                  MyLoadingWidgets.noInternetConnectionDialogue();
                  return;
                }

                final newQuantity = int.tryParse(quantityController.text) ?? quantity_.value;

                // Validation: Check if the quantity is non-negative
                if (newQuantity < 0) {
                  Get.back(); // Close the loading dialog
                  MyLoadingWidgets.errorSnackBar(title: 'Error', message: 'Quantity cannot be negative');
                  return;
                }
                // Update in Firestore
                final itemRepository = ItemData();
                await itemRepository.updateField(item_.id, 'Quantity', newQuantity);

                // Update the reactive item
                quantity_.value = newQuantity;

                // Update the item in ManageItemsController's allItems list
                final manageItemsController = ManageItemsController.instance;
                final index = manageItemsController.allItems.indexWhere((item) => item.id == item_.id);

                if (index != -1) {
                  // Update the quantity in the list
                  // manageItemsController.allItems[index] = manageItemsController.allItems[index].copyWith(quantity: newQuantity);
                  manageItemsController.allItems[index].quantity = newQuantity;
                }
                Get.back();
                MyLoadingWidgets.successSnackBar(title: 'Success', message: 'Quantity updated successfully');
              } catch (e) {
                Get.back();
                MyLoadingWidgets.errorSnackBar(title: 'Error', message: e.toString());
              }
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  double fixedPrecision(double val) {
    return double.parse(val.toStringAsFixed(1));
  }
}
