import 'package:flutter/material.dart';
import 'package:smart_cafeteria/config/get_config.dart';

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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: getColorScheme(context).secondaryContainer),
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
    return Divider(color: getColorScheme(context).outlineVariant, height: 13, thickness: 1.5);
  }
}

class MyOrderDetailStatusRow extends StatelessWidget {
  const MyOrderDetailStatusRow({
    super.key,
    required this.label,
    required this.status,
    this.colorStatus = false,
    this.statusColor,
  });

  final String label;
  final String status;
  final bool colorStatus;
  final Color? statusColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: getTextTheme(context).labelLarge?.copyWith(color: getColorScheme(context).onSurfaceVariant, fontSize: 15.5)),
        Text(
          status,
          style: getTextTheme(context)
              .labelSmall
              ?.copyWith(color: colorStatus ? statusColor : getColorScheme(context).onSecondaryContainer, fontSize: 17),
        ),
      ],
    );
  }
}
