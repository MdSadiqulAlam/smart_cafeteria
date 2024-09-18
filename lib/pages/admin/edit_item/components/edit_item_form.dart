import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/utilities/validators.dart';

import 'package:smart_cafeteria/model/item_model.dart';
import 'package:smart_cafeteria/pages/admin/edit_item/components/edit_item_controller.dart';

class EditItemForm extends StatelessWidget {
  final ItemModel item;

  const EditItemForm({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditItemController());

    /// Initialize the controller with the existing item data
    controller.initializeItemData(item);

    return Form(
      key: controller.editItemFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // update image
          Text('Update Item Image', style: getTextTheme(context).titleLarge?.copyWith(fontWeight: FontWeight.w500)),
          const SizedBox(height: 12),
          Obx(
            () => GestureDetector(
              onTap: () => controller.pickItemImage(),
              child: Container(
                width: double.infinity,
                height: getScreenWidth(context) * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: getColorScheme(context).onSurface),
                ),
                child: controller.selectedImagePath.value.isNotEmpty && File(controller.selectedImagePath.value).existsSync()
                    ? Image.file(
                        File(controller.selectedImagePath.value),
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        imageUrl: controller.currentItem.imagePath,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
              ),
            ),
          ),

          ///name
          const SizedBox(height: 30),
          TextFormField(
            controller: controller.itemName,
            validator: (value) => MyValidator.validateEmptyText('Item Name', value),
            expands: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
              labelText: 'Item Name',
            ),
          ),

          /// price , kcal
          const SizedBox(height: 20),
          Row(
            children: [
              /// price
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.price,
                  validator: (value) => MyValidator.validatePrice(value),
                  expands: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                    labelText: 'Price (BDT)',
                  ),
                ),
              ),

              /// kcal
              const SizedBox(width: 15),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.kcal,
                  validator: (value) => MyValidator.validateCalorie(value),
                  expands: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                    labelText: 'Calories (kCal)',
                  ),
                ),
              ),
            ],
          ),

          /// Category , Quantity
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: controller.quantity,
            validator: (value) => MyValidator.validateStockQuantity(value),
            expands: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
              labelText: 'Stock Quantity',
            ),
          ),

          /// category
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Select Categories', style: getTextTheme(context).titleLarge?.copyWith(fontWeight: FontWeight.w500)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 10.0, // Space between checkboxes
                      children: controller.categories.map((category) {
                        return Obx(() => FilterChip(
                              label: Text(category.capitalizeFirst!),
                              selected: controller.selectedCategories.contains(category),
                              onSelected: (bool selected) {
                                if (selected) {
                                  controller.selectedCategories.add(category);
                                } else {
                                  controller.selectedCategories.remove(category);
                                }
                              },
                            ));
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),

          /// Item Detail
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.itemDetail,
            validator: (value) => MyValidator.validateEmptyText('Item Details', value),
            maxLines: 2,
            expands: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
              labelText: 'Item Details',
            ),
          ),

          /// Description
          const SizedBox(height: 20),
          SizedBox(
            height: 150, // Adjust height as needed
            child: TextFormField(
              controller: controller.description,
              validator: (value) => MyValidator.validateEmptyText('Item Description', value),
              maxLines: 20,
              expands: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                labelText: 'Description',
              ),
            ),
          ),

          /// button
          /// create item button
          const SizedBox(height: 40),
          Center(
            child: SizedBox(
              width: getScreenWidth(context) * 0.7,
              child: FilledButton(
                onPressed: () async {
                  /// bottom sheet
                  // emailVerificationBottomSheet(context: context, email_: 'sadiqul@gmail.com');
                  controller.updateItem(context);
                },
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  backgroundColor: getColorScheme(context).primary.withOpacity(0.9),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                child: const Text('Update Item', style: TextStyle(fontSize: 20)),
              ),
            ),
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
