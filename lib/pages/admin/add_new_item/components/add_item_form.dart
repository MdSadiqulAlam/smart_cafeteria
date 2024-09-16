import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/pages/admin/add_new_item/components/add_item_controller.dart';

import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/utilities/validators.dart';

class AddItemForm extends StatelessWidget {
  const AddItemForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddItemController());

    return Form(
      key: controller.addItemFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// upload image
          Text('Upload Item Image', style: getTextTheme(context).titleLarge?.copyWith(fontWeight: FontWeight.w500)),
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
                  image: DecorationImage(
                    image: controller.selectedImagePath.value.isEmpty
                        ? const AssetImage('assets/default_image/upload_image.png') // Default image
                        : FileImage(File(controller.selectedImagePath.value)) as ImageProvider,
                    fit: BoxFit.cover, // Ensure the image fits nicely
                  ),
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
          // ),

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

          /// create item
          const SizedBox(height: 40),
          Center(
            child: SizedBox(
              width: getScreenWidth(context) * 0.7,
              child: FilledButton(
                onPressed: () {
                  /// bottom sheet
                  // emailVerificationBottomSheet(context: context, email_: 'sadiqul@gmail.com');
                  controller.createItem(context);
                },
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  backgroundColor: getColorScheme(context).primary.withOpacity(0.9),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                child: const Text('Create Item', style: TextStyle(fontSize: 20)),
              ),
            ),
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
