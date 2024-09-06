import 'package:flutter/material.dart';
import 'package:smart_cafeteria/components/appbar.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/model/test/notification_model.dart';
import 'components/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double cardHeight = getAppBarHeight() * 1.27;
    // final timeNow = DateTime.now();
    // print(DateFormat('yMMMMd').format(timeNow));
    // print(DateFormat('Hms').format(timeNow));

    return Scaffold(
      appBar: const MyAppbar(showTitle: true, pageTitle: 'Notifications', titlePadding: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(13, 5, 13, 2),
        physics: const BouncingScrollPhysics(),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: allNotifications.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (_, int index) {
            final NotificationModel notification_ = allNotifications[index];

            return NotificationCard(cardHeight: cardHeight, notification_: notification_);
          },
        ),
      ),
    );
  }
}
