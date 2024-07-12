import 'package:flutter/material.dart';
import 'payment_screen.dart';


void checkoutBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).colorScheme.surfaceContainer,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Select Payment Method',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Image.asset('assets/test_icons/bkash.png'),
              title: const Text('Bkash'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(paymentMethod: 'bkash'),
                  ),
                );
              },
            ),
            ListTile(
              leading: Image.asset('assets/test_icons/nagad.png'),
              title: const Text('Nagad'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(paymentMethod: 'nagad'),
                  ),
                );
              },
            ),
            ListTile(
              leading: Image.asset('assets/test_icons/paypal.png'),
              title: const Text('Paypal'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PaymentScreen(paymentMethod: 'paypal'),
                  ),
                );
              },
            ),
            ListTile(
              leading: Image.asset('assets/test_icons/master_card.png'),
              title: const Text('Master Card'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PaymentScreen(paymentMethod: 'master_card'),
                  ),
                );
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Amount:',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '970 TK',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.error,
                    ),
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
