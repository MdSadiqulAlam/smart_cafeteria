import 'package:get/get.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display/item_display_controller.dart';
import 'package:smart_cafeteria/model/item_model.dart';

class CarouselSliderController extends GetxController {
  // List to store the first 5 items for the carousel
  final carouselItems = <ItemModel>[].obs;

  // To keep track of the current index of the carousel
  final currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize carouselItems based on the first 5 items from ItemDisplayController
    updateCarouselItems();
    // Listen to allItems changes in ItemDisplayController and update carouselItems
    ItemDisplayController.instance.allItems.listen((_) {
      updateCarouselItems();
    });
  }

  /// Update carouselItems with the first 5 items from allItems
  void updateCarouselItems() {
    final allItems = ItemDisplayController.instance.allItems;
    carouselItems.value = allItems.take(5).toList();
  }
}
