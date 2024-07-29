class NotificationModel {
  const NotificationModel({
    required this.itemIndex,
    required this.notificationText,
    required this.notificationTime,
  });

  final String notificationText;
  final DateTime notificationTime;

  /// todo: index without backend
  final int itemIndex;
}

/// total items= 27
List<NotificationModel> allNotifications = <NotificationModel>[
  NotificationModel(
    itemIndex: 2,
    notificationText: 'is available now!',
    notificationTime: DateTime.now(),
  ),
  NotificationModel(
    itemIndex: 0,
    notificationText: 'will end in 15 minutes. Hurry up!',
    notificationTime: DateTime.now(),
  ),
  NotificationModel(
    itemIndex: 4,
    notificationText: 'is available now!',
    notificationTime: DateTime.now(),
  ),
  NotificationModel(
    itemIndex: 19,
    notificationText: 'is newly added item. Taste it now!',
    notificationTime: DateTime.now(),
  ),
];
