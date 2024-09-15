import 'package:flutter/material.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/model/test/item_model.dart';
import 'package:smart_cafeteria/model/test/order_model.dart';
import 'order_detail_component.dart';
import 'ordered_item_card.dart';

class OrderedItemDropDown extends StatefulWidget {
  const OrderedItemDropDown({super.key, required this.order_});

  final OrderModel order_;

  @override
  State<OrderedItemDropDown> createState() => _OrderedItemDropDownState();
}

class _OrderedItemDropDownState extends State<OrderedItemDropDown> {
  bool expanded = false;

  void _expand() {
    setState(() {
      expanded = !expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final order_ = widget.order_;

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
                onPressed: () {
                  _expand();
                },
                style: IconButton.styleFrom(padding: const EdgeInsets.all(0), iconSize: 28),
                icon: Icon(
                  expanded ? Icons.keyboard_arrow_up_sharp : Icons.keyboard_arrow_down_sharp,
                  color: getColorScheme(context).error,
                ),
              ),
            ),
          ],
        ),
        expanded ? const SizedBox(height: 15) : const SizedBox.shrink(),
        expanded
            ? ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: order_.orderedItems.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (_, int index) {
                  OrderedItemModel orderedItem_ = order_.orderedItems[index];
                  ItemModel item_ = allItems[orderedItem_.itemIndex];
                  final double cardHeight = getAppBarHeight() * 1.49;

                  return OrderedItemCard(item_: item_, cardHeight: cardHeight, orderedItem_: orderedItem_);
                },
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}