import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smart_cafeteria/components/appbar.dart';

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
            color: Theme.of(context).colorScheme.surface,
            alignment: Alignment.center,
            child: Image.asset(
              'assets/test_icons/$paymentMethod.png',
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
          const Positioned(
            bottom: 25,
            right: 35,
            left: 35,
            child: ConfirmPaymentButton(),
          ),
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
    if (!loadingPayment) {
      setState(() {
        loadingPayment = true;
      });
      await Future.delayed(const Duration(milliseconds: 2000), () {});
      setState(() {
        loadingPayment = false;
      });
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Payment Received"),
          duration: Duration(milliseconds: 1000),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: FilledButton.tonal(
        onPressed: () {
          _loadPayment();
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: loadingPayment == false
              ? Text(
                  'Confirm Payment',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 20),
                  // style: TextStyle(fontSize: 20),
                )
              : LoadingAnimationWidget.fourRotatingDots(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  size: 30,
                ),
        ),
      ),
    );
  }
}
