import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smart_cafeteria/components/appbar.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display_controller.dart';
import 'package:smart_cafeteria/pages/order_screens/orders/components/order_controller.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key, required this.paymentMethod});

  final String paymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(pageTitle: 'Payment Screen', showTitle: true),
      body: Stack(
        children: [
          Container(
            color: getColorScheme(context).surface,
            alignment: Alignment.center,
            child: Image.asset(
              'assets/test_icons/$paymentMethod.png',
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
          Positioned(bottom: 25, left: 0, right: 0, child: ConfirmPaymentButton()),
        ],
      ),
    );
  }
}

class ConfirmPaymentButton extends StatelessWidget {
  ConfirmPaymentButton({super.key});

  final RxBool loadingPayment = false.obs;

  void _loadPayment() async {
    if (loadingPayment.value == false) {
      loadingPayment.value = true;
      try {
        /// todo : place order
        await OrderController.instance.placeOrder();

        Get.back();
        Get.back();
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(content: Text("Payment Received"), duration: Duration(milliseconds: 1000)),
        );
      } catch (e) {
        MyLoadingWidgets.errorSnackBar(title: 'Payment Failed', message: 'Error: $e');
      } finally {
        loadingPayment.value = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: loadingPayment.value
            ? FilledButton.tonal(
                key: const ValueKey<bool>(true),
                onPressed: () => _loadPayment(),
                style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
                child: LoadingAnimationWidget.fourRotatingDots(
                  color: getColorScheme(context).onSecondaryContainer,
                  size: 30,
                ),
              )
            : FilledButton.tonal(
                key: const ValueKey<bool>(false),
                onPressed: () => _loadPayment(),
                style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
                child: Text(
                  key: const ValueKey<bool>(false),
                  'Confirm Payment',
                  style: getTextTheme(context).titleMedium?.copyWith(fontSize: 20),
                ),
              ),
      ),
    );
  }
}
