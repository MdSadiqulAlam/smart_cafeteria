import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/onboarding/components/onboarding_controller.dart';
import 'package:smart_cafeteria/pages/onboarding/components/onboarding_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          Container(
            // height: getScreenHeight(context), //* 0.45,
            // color: const Color(0xFFECFFCC),
            color: getColorScheme(context).primaryContainer.withOpacity(0.8),
          ),
          const CircleDesignTopLeft(),
          const CircleDesignTopRight(),

          /// horizontal scrollable widgets
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                imagePath: 'assets/onboard_image/welcome1.png',
                title: 'Welcome to SmartCafe',
                subtitle:
                    'Elevate your dining experience with this gastronomic delight that transcends ordinary meals into extraordinary feasts!',
              ),
              OnBoardingPage(
                imagePath: 'assets/onboard_image/welcome2.png',
                title: 'Explore & Order',
                subtitle:
                    'Discover new flavors and effortlessly place your orders with our easy-to-use app, designed to enhance your testBuds!',
              ),
            ],
          ),

          /// skip button
          Positioned(
            top: getAppBarHeight(),
            right: 0,
            child: TextButton(
              onPressed: () {
                OnBoardingController.instance.skipPage();
              },
              child: const Text('Skip'),
            ),
          ),

          /// Page indicator
          Positioned(
            bottom: getBottomNavBarHeight() + 30,
            left: 30,
            child: SmoothPageIndicator(
              controller: controller.pageController,
              onDotClicked: controller.dotNavigationClick,
              count: 2,
              effect: ExpandingDotsEffect(activeDotColor: getColorScheme(context).primary, dotHeight: 7),
            ),
          ),

          /// next button
          Positioned(
            bottom: getBottomNavBarHeight() + 15,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                OnBoardingController.instance.nextPage();
              },
              style: ElevatedButton.styleFrom(shape: const CircleBorder(), padding: const EdgeInsets.all(10)),
              child: const Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
        ],
      ),
    );
  }
}

class CircleDesignTopRight extends StatelessWidget {
  const CircleDesignTopRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 5,
      top: 130,
      child: SizedBox(
        width: 80,
        height: 89,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                  width: 16, height: 16, decoration: const ShapeDecoration(color: Color(0xFFDFA67B), shape: OvalBorder())),
            ),
            Positioned(
              left: 8,
              top: 17,
              child: Container(
                width: 72,
                height: 72,
                decoration: const ShapeDecoration(color: Color(0xFFF5D10C), shape: OvalBorder()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleDesignTopLeft extends StatelessWidget {
  const CircleDesignTopLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -25,
      top: 200,
      child: SizedBox(
        width: 80,
        height: 89,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                  width: 72, height: 72, decoration: const ShapeDecoration(color: Color(0xFFFF6347), shape: OvalBorder())),
            ),
            Positioned(
              left: 64,
              top: 73,
              child: Container(
                  width: 16, height: 16, decoration: const ShapeDecoration(color: Color(0xFFF4B183), shape: OvalBorder())),
            ),
          ],
        ),
      ),
    );
  }
}
