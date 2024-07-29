import 'package:flutter/material.dart';
import 'package:smart_cafeteria/config/get_config.dart';

import '../../payment/checkout_bottom_sheet.dart';

class CheckoutSegment extends StatelessWidget {
  const CheckoutSegment({super.key});

  @override
  Widget build(BuildContext context) {
    const double textSize_ = 18;

    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(horizontal: BorderSide(color: getColorScheme(context).outline, width: 0.5)),
        color: getColorScheme(context).secondaryContainer,
      ),
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
                  color: getColorScheme(context).onSecondaryContainer,
                  size: textSize_ + 3,
                ),
                Text(
                  "200 Cal",
                  style: getTextTheme(context).labelLarge?.copyWith(
                        color: getColorScheme(context).onSecondaryContainer,
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
                  style: getTextTheme(context).labelLarge?.copyWith(
                        color: getColorScheme(context).onSecondaryContainer,
                        fontSize: textSize_,
                      ),
                ),
                TextSpan(
                  text: "970 Tk.",
                  style: getTextTheme(context).labelLarge?.copyWith(
                        // color: Theme.of(context).colorScheme.onSecondaryContainer,
                        color: getColorScheme(context).error,
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
            style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 17)),
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
