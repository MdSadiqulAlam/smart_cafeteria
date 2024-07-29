import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smart_cafeteria/components/appbar.dart';
import 'package:smart_cafeteria/config/get_config.dart';

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
          const Positioned(bottom: 25, left: 0, right: 0, child: ConfirmPaymentButton()),
        ],
      ),
    );
  }
}

class ConfirmPaymentButton extends StatefulWidget {
  const ConfirmPaymentButton({super.key});

  @override
  State<ConfirmPaymentButton> createState() => _ConfirmPaymentButtonState();
}

class _ConfirmPaymentButtonState extends State<ConfirmPaymentButton> {
  bool loadingPayment = false;

  void _loadPayment() async {
    if (loadingPayment == false) {
      setState(() {
        loadingPayment = true;
      });
      await Future.delayed(const Duration(milliseconds: 2000), () {});
      setState(() {
        loadingPayment = false;
      });
      Get.back();
      // Get.snackbar('title', 'message',backgroundColor: getColorScheme(context).tertiaryContainer);
      // Get.defaultDialog(title: 'ta');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Payment Received"), duration: Duration(milliseconds: 1000)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: loadingPayment
          ? FilledButton.tonal(
              key: const ValueKey<bool>(true),
              onPressed: () {
                _loadPayment();
              },
              style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
              child: LoadingAnimationWidget.fourRotatingDots(
                color: getColorScheme(context).onSecondaryContainer,
                size: 30,
              ),
            )
          : FilledButton.tonal(
              key: const ValueKey<bool>(false),
              onPressed: () {
                _loadPayment();
              },
              style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
              child: Text(
                key: const ValueKey<bool>(false),
                'Confirm Payment',
                style: getTextTheme(context).titleMedium?.copyWith(fontSize: 20),
              ),
            ),
    );
  }
}
