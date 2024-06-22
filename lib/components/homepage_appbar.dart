import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    // Adjust multiplier as needed
    final double myIconSize = preferredSize.height * 0.6;

    return AppBar(
      // backgroundColor:
      //     Theme.of(context).colorScheme.inversePrimary, // not needed
      // backgroundColor: Theme.of(context).colorScheme.surface,
      title:  const Text("title nai"),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications_none,
            color: Theme.of(context).colorScheme.primary,
          ),
          // tooltip: "Notification",
          onPressed: () {},
        ),
        IconButton(
          onPressed: () {},
          // tooltip: "Profile",
          style: IconButton.styleFrom(
            padding: const EdgeInsets.all(0),
          ),
          icon: Icon(
            Icons.account_circle,
            color: Theme.of(context).colorScheme.primary,
          ),
          iconSize: myIconSize,
        ),
        const SizedBox(width: 15),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
