import 'package:flutter/material.dart';
import '../../../config/get_config.dart';

class MyOrderDetailContainer extends StatelessWidget {
  const MyOrderDetailContainer({
    super.key,
    // required this.order_,
    required this.components_,
  });

  // final MyOrderInfo order_;
  final List<Widget> components_;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: getColorScheme(context).secondaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: components_,
        ),
      ),
    );
  }
}

class MyOrderDetailsLabel extends StatelessWidget {
  const MyOrderDetailsLabel({
    super.key,
    required this.label_,
  });

  final String label_;

  @override
  Widget build(BuildContext context) {
    return Text(
      label_,
      style: getTextTheme(context).titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: getColorScheme(context).onSurface,
          ),
    );
  }
}

class MyOrderDetailHorizontalDivider extends StatelessWidget {
  const MyOrderDetailHorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: getColorScheme(context).outlineVariant,
      height: 13,
      thickness: 1.5,
    );
  }
}

class MyOrderDetailStatusRow extends StatelessWidget {
  const MyOrderDetailStatusRow({
    super.key,
    required this.label,
    required this.status,
  });

  final String label;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: getTextTheme(context).labelLarge?.copyWith(
                color: getColorScheme(context).outline,
                fontSize: 15,
              ),
        ),
        Text(
          status,
          style: getTextTheme(context).labelSmall?.copyWith(
                color: getColorScheme(context).onSecondaryContainer,
                fontSize: 17,
                // fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}

// class OrderAgainButton extends StatefulWidget {
//   const OrderAgainButton({super.key});
//
//   @override
//   State<OrderAgainButton> createState() => _OrderAgainButtonState();
// }
//
// class _OrderAgainButtonState extends State<OrderAgainButton> {
//   bool reordering = false;
//
//   void _loadPayment() async {
//     if (!reordering) {
//       setState(() {
//         reordering = true;
//       });
//       await Future.delayed(const Duration(milliseconds: 2000), () {});
//       setState(() {
//         reordering = false;
//       });
//       Navigator.pop(context);
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Order"),
//           duration: Duration(milliseconds: 1000),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 17),
//       child: AnimatedSwitcher(
//         duration: const Duration(milliseconds: 300),
//         transitionBuilder: (Widget child, Animation<double> animation) {
//           return ScaleTransition(
//             scale: animation,
//             child: child,
//           );
//         },
//         child: reordering == false
//             ? FilledButton.tonal(
//                 onPressed: () {
//                   _loadPayment();
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 10.0,
//                     horizontal: 25,
//                   ),
//                   child: Text(
//                     'Re-Order',
//                     style: Theme.of(context)
//                         .textTheme
//                         .titleMedium
//                         ?.copyWith(fontSize: 20),
//                     // style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//               )
//             : Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(40),
//                   color: Theme.of(context).colorScheme.secondaryContainer,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 7,
//                     horizontal: 40,
//                   ),
//                   child: LoadingAnimationWidget.fourRotatingDots(
//                     color: Theme.of(context).colorScheme.onSecondaryContainer,
//                     size: 36,
//                   ),
//                 ),
//               ),
//       ),
//     );
//   }
// }
