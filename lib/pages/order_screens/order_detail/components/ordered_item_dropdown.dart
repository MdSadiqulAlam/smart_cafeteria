import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/model/order_model.dart';
import 'order_detail_component.dart';
import 'ordered_item_card.dart';

class OrderedItemDropDown extends StatelessWidget {
  OrderedItemDropDown({super.key, required this.order_});

  final OrderModel order_;

  final RxBool expanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return MyOrderDetailContainer(
      components_: [
        MyOrderDetailStatusRow(label: 'Total Price', status: '${order_.totalPaid} TK'),
        const MyOrderDetailHorizontalDivider(),
        Row(
          children: [
            Expanded(child: MyOrderDetailStatusRow(label: 'Items', status: 'Qty. ${order_.totalItem} ')),
            SizedBox(
              height: 28,
              width: 28,
              child: IconButton(
                onPressed: () => expanded.value = !expanded.value,
                style: IconButton.styleFrom(padding: const EdgeInsets.all(0), iconSize: 28),
                icon: Obx(() => Icon(
                      expanded.value ? Icons.keyboard_arrow_up_sharp : Icons.keyboard_arrow_down_sharp,
                      color: getColorScheme(context).error,
                    )),
              ),
            ),
          ],
        ),
        Obx(() => expanded.value
            ? Column(
                children: [
                  const SizedBox(height: 8),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: order_.orderedItems.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (_, int index) {
                      OrderedItemModel orderedItem_ = order_.orderedItems[index];
                      return OrderedItemCard(orderedItem_: orderedItem_);
                    },
                  ),
                ],
              )
            : const SizedBox.shrink()),
      ],
    );
  }
}
