import 'package:flutter/material.dart';
import 'package:smart_cafeteria/pages/cart/payment_screens/payment_screen.dart';

class CheckoutSegment extends StatelessWidget {
  const CheckoutSegment({super.key});

  @override
  Widget build(BuildContext context) {
    const double textSize_ = 19;
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 0.5,
          ),
        ),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            // color: Colors.red,
            padding: const EdgeInsets.only(bottom: 7),
            child: Row(
              children: [
                Icon(
                  Icons.local_fire_department_outlined,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  size: textSize_ + 3,
                ),
                Text(
                  "200",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        fontSize: textSize_,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            // color: Colors.yellowAccent,
            padding: const EdgeInsets.only(bottom: 7),
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: "Total: ",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        fontSize: textSize_,
                      ),
                ),
                TextSpan(
                  text: "970 Tk.",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        // color: Theme.of(context).colorScheme.onSecondaryContainer,
                        color: Theme.of(context).colorScheme.error,
                        fontSize: textSize_ + 3,
                      ),
                ),
              ]),
            ),
          ),
          FilledButton(
            onPressed: () {
              checkoutBottomSheet(context);
            },
            style: FilledButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 17)),
            child: Text(
              "CheckOut (7)",
              style: TextStyle(fontSize: textSize_ - 2),
            ),
          ),
        ],
      ),
    );
  }
}

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
