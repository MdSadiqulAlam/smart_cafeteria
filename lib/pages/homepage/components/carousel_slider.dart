import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselItem {
  String imgPath;
  String price;

  CarouselItem({
    required this.imgPath,
    required this.price,
  });
}

final List<CarouselItem> itemList = [
  CarouselItem(
      imgPath: 'assets/test_image/carousel/chicken1.png', price: "100"),
  CarouselItem(
      imgPath: 'assets/test_image/carousel/khichuri1.png', price: "55"),
  CarouselItem(
      imgPath: 'assets/test_image/carousel/sandwich1.png', price: "50"),
  CarouselItem(imgPath: 'assets/test_image/carousel/shin2.png', price: "10"),
  CarouselItem(imgPath: 'assets/test_image/carousel/sub1.png', price: "80"),
];

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
          items: itemList.map((item) {
            return InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Item ${currentIndex + 1} tapped"),
                    duration: const Duration(milliseconds: 700),
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
                    item.imgPath,
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
            autoPlayInterval: const Duration(seconds: 3),
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
      children: List.generate(itemList.length, (index) {
        bool isSelected = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.linear,
          margin: EdgeInsets.symmetric(horizontal: isSelected ? 5 : 2),
          width: isSelected ? 33 : 12,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: isSelected ? Colors.grey[600] : Colors.grey[400],
            // ? Theme.of(context).colorScheme.onTertiaryFixed
          ),
        );
      }),
    );
  }
}
