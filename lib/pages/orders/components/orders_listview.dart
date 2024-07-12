import 'package:flutter/material.dart';
import 'package:smart_cafeteria/model/test_model/order_info.dart';
import 'order_card.dart';

class OrdersListview extends StatelessWidget {
  const OrdersListview(
      {super.key, this.filter = false, this.completed = false});

  final bool filter;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    final List<MyOrderInfo> filteredOrders = filter
        ? (completed ? completedOrders : pendingOrders)
        : [...pendingOrders, ...completedOrders];

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 2),
      physics: const BouncingScrollPhysics(),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: filteredOrders.length,
        separatorBuilder: (_, __) => const SizedBox(height: 15),
        itemBuilder: (_, int index) {
          MyOrderInfo order_ = filteredOrders[index];

          return OrderCard(order_: order_);
        },
      ),
    );
  }
}



// class MyAnimatedText extends StatefulWidget {
//   const MyAnimatedText({super.key});
//
//   @override
//   State<MyAnimatedText> createState() => _MyAnimatedTextState();
// }
// class _MyAnimatedTextState extends State<MyAnimatedText>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation animation;
//   late Color color_;
//
//   @override
//   @mustCallSuper
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 3000),
//     );
//     animation =
//         ColorTween(begin: Colors.amber.shade800, end: Colors.greenAccent)
//             .animate(controller);
//
//     animation.addListener(() {
//       setState(() {
//         color_ = animation.value;
//       });
//     });
//
//     controller.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       'Pending Pickup',
//       style: getTextTheme(context).labelLarge?.copyWith(
//             fontStyle: FontStyle.italic,
//             fontSize: 16,
//             color: color_,
//           ),
//     );
//   }
// }
