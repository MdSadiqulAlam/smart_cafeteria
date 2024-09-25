import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'payment_screen.dart';

Future<void> checkoutBottomSheet({required BuildContext context, required num totalPrice}) async {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: getScreenHeight(context) * 0.6,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: getColorScheme(context).surfaceContainer),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const Text('Select Payment Method', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ListTile(
              leading: Image.asset('assets/test_icons/bkash.png'),
              title: const Text('Bkash'),
              onTap: () {
                Get.off(() => const PaymentScreen(paymentMethod: 'bkash'));
              },
            ),
            ListTile(
              leading: Image.asset('assets/test_icons/nagad.png'),
              title: const Text('Nagad'),
              onTap: () {
                Get.off(() => const PaymentScreen(paymentMethod: 'nagad'));
              },
            ),
            ListTile(
              leading: Image.asset('assets/test_icons/paypal.png'),
              title: const Text('Paypal'),
              onTap: () {
                Get.off(() => const PaymentScreen(paymentMethod: 'paypal'));
              },
            ),
            ListTile(
              leading: Image.asset('assets/test_icons/master_card.png'),
              title: const Text('Master Card'),
              onTap: () {
                Get.off(() => const PaymentScreen(paymentMethod: 'master_card'));
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Amount:', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  Text(
                    '$totalPrice TK',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: getColorScheme(context).error),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
