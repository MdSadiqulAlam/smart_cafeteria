import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key, this.transparent = false});

  final bool transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: transparent ? Colors.transparent : const Color(0xFFBEC9BE),
      body: Container(
        height: getScreenHeight(context),
        width: getScreenWidth(context),
        // color: const Color(0xFFBEC9BE),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(color: Color(0xFF2E3830)),
      ),
    );
  }
}

class MyLoadingWidgets {
  /// loading dialogue
  static Future<void> loadingDialogue() async {
    showDialog<void>(
      context: Get.overlayContext!,
      builder: (BuildContext _) {
        return const PopScope(
          /// todo: canPop  will be false
          canPop: false, // disable popping with back button
          child: Dialog(child: SizedBox(height: 200, width: 250, child: Center(child: CircularProgressIndicator()))),
        );
      },
    );
  }

  /// no internet dialogue
  static Future<void> noInternetConnectionDialogue() async {
    showDialog<void>(
      context: Get.overlayContext!,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            height: 200,
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 40, color: getColorScheme(context).error),
                const SizedBox(height: 20),
                const Text('Internet Not Available', style: TextStyle(fontSize: 22)),
              ],
            ),
          ),
        );
      },
    );
  }

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 3,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: getBrightness(Get.context!) ? Colors.grey : Colors.black.withOpacity(0.9),
          ),
          child: Text(message),
        ),
      ),
    );
  }

  static successSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: getColorScheme(Get.context!).onPrimaryContainer,
      backgroundColor: getColorScheme(Get.context!).primaryContainer,
      // snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: Icon(Icons.check_circle_outline, color: getColorScheme(Get.context!).onPrimaryContainer),
    );
  }

  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.orange,
      // snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.warning_amber, color: Colors.white),
    );
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade600,
      // snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.warning_amber, color: Colors.white),
    );
  }
}
