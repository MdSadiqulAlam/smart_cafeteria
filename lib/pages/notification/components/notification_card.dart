import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../config/get_config.dart';
import '../../../model/item_model.dart';
import '../../../model/notification_model.dart';
import '../../item_detail/item_detail.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.cardHeight, required this.notification_});

  final double cardHeight;
  final NotificationModel notification_;

  @override
  Widget build(BuildContext context) {
    final String imagePath_ = allItems[notification_.itemIndex].imagePath;
    final String notificationTime = DateFormat('Hm').format(notification_.notificationTime);
    final String notificationDate = DateFormat('MMMd').format(notification_.notificationTime);
    final ItemModel item_ = allItems[notification_.itemIndex];

    return Stack(
      children: [
        InkWell(
          onTap: () {
            Get.to(()=>ItemDetail(item_: item_));
          },
          child: Ink(
            height: cardHeight,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: getColorScheme(context).secondaryContainer),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// image
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    elevation: 7,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child:
                          ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.asset(imagePath_, fit: BoxFit.cover)),
                    ),
                  ),
                ),

                /// message
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(3, 7, 12, 3),
                    child: Text(
                      '${allItems[notification_.itemIndex].name.toCapitalCase()} ${notification_.notificationText}',
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        /// time and date
        Positioned(
          right: 0,
          bottom: 0,
          child:
              Padding(padding: const EdgeInsets.only(right: 5, bottom: 3), child: Text('$notificationTime,  $notificationDate')),
        )
      ],
    );
  }
}
