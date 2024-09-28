import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/item_detail/item_detail.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display_controller.dart';
import 'package:smart_cafeteria/pages/homepage/components/carousel_slider/carousel_slider_controller.dart';

class CarouselWithIndicator extends StatelessWidget {
  const CarouselWithIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CarouselSliderController());

    return Obx(() {
      // Show loading animation based on ItemDisplayController's isLoading state
      if (ItemDisplayController.instance.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return Stack(
        children: [
          CarouselSlider(
            items: controller.carouselItems.map((item) {
              return InkWell(
                onTap: () => Get.to(() => ItemDetail(item_: item)),
                borderRadius: BorderRadius.circular(15),
                child: Ink(
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    // child: Image.asset(item.imagePath, fit: BoxFit.cover),
                    child: CachedNetworkImage(
                      imageUrl: item.imagePath,
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
              );
            }).toList(),
            options: CarouselOptions(
              aspectRatio: 2,
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 0.85,
              autoPlayInterval: const Duration(milliseconds: 2000),
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                controller.currentIndex.value = index;
              },
            ),
          ),
          Positioned(bottom: 7, left: 0, right: 0, child: buildCarouselIndicator(controller)),
        ],
      );
    });
  }

  Widget buildCarouselIndicator(CarouselSliderController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(controller.carouselItems.length, (index) {
        bool isSelected = index == controller.currentIndex.value;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: EdgeInsets.symmetric(horizontal: isSelected ? 5 : 2),
          width: isSelected ? 33 : 11,
          height: 5.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: isSelected ? Colors.grey.shade600 : Colors.grey.shade400,
          ),
        );
      }),
    );
  }
}
