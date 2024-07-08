import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../model/test_model/item_info.dart';
import '../../item_detail/item_detail.dart';

class CarouselWithIndicator extends StatefulWidget {
  const CarouselWithIndicator({super.key});

  @override
  State<CarouselWithIndicator> createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          // items: imgList.map((imgPath) =>Image.asset(imgPath)).toList() ,
          items: allItems.take(5).map((item) {
            return InkWell(
              onTap: () {
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content: Text("Item ${currentIndex + 1} tapped"),
                //     duration: const Duration(milliseconds: 700),
                //   ),
                // );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetail(item_: allItems.first),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(15),
              child: Ink(
                width: MediaQuery.sizeOf(context).width * 0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    item.imagePath,
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
            autoPlayInterval: const Duration(milliseconds: 2500),
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 7,
          left: 0,
          right: 0,
          child: buildCarouselIndicator(),
        )
      ],
    );
  }

  buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(5, (index) {
        bool isSelected = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.linear,
          margin: EdgeInsets.symmetric(horizontal: isSelected ? 5 : 2),
          width: isSelected ? 33 : 12,
          height: 6.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: isSelected ? Colors.grey[600] : Colors.grey[400],
          ),
        );
      }),
    );
  }
}
