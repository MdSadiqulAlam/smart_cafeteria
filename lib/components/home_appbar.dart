import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final double iconSize =
        preferredSize.height * 0.6; // Adjust multiplier as needed
    return AppBar(
      backgroundColor:
          Theme.of(context).colorScheme.inversePrimary, // not needed
      // backgroundColor: Theme.of(context).colorScheme.surface,
      title: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Row(
          children: [
            Expanded(child: Text("title nai")),
            IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Theme.of(context).colorScheme.primary,
              ),
              // tooltip: "Notification",
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.account_circle,
                color: Theme.of(context).colorScheme.primary,
                // size: iconSize,
              ),
              iconSize: iconSize,
              // tooltip: "Profile",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
