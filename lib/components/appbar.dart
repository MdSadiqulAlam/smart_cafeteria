import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({
    super.key,
    this.currentPage,
    this.pageTitle = "",
    this.showTitle = false,
    this.showNotification = false,
    this.viewProfile = false,
  });

  final int? currentPage;
  final String? pageTitle;
  final bool showTitle;
  final bool showNotification;
  final bool viewProfile;

  @override
  Widget build(BuildContext context) {
    double searchBarHeight =
        const Size.fromHeight(kToolbarHeight).height * 0.75;

    return AppBar(
      // surfaceTintColor: Theme.of(context).colorScheme.secondaryContainer,
      titleSpacing: 0,
      // title: const Text("Search Bar"),
      title: Visibility(
          visible: showTitle,
          child: currentPage == 0
              ? Searchbar(
                  searchBarHeight: searchBarHeight,
                  preferredSize: preferredSize)
              : Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    pageTitle!,
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                )),
      actions: [
        Visibility(
          visible: showNotification,
          child: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Notification"),
                  duration: Duration(milliseconds: 700),
                ),
              );
            },
            icon: Icon(
              Icons.notifications_none,
              color: Theme.of(context).colorScheme.primary,
            ),
            iconSize: preferredSize.height * 0.48,
            // tooltip: "Notification",
          ),
        ),
        Visibility(
          // visible: currentPage == 0,
          visible: viewProfile,
          child: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("View Profile"),
                  duration: Duration(milliseconds: 700),
                ),
              );
            },
            // tooltip: "Profile",
            style: IconButton.styleFrom(
              padding: const EdgeInsets.all(0),
            ),
            icon: Icon(
              Icons.account_circle,
              color: Theme.of(context).colorScheme.primary,
            ),
            iconSize: preferredSize.height * 0.6,
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class Searchbar extends StatelessWidget {
  const Searchbar({
    super.key,
    required this.searchBarHeight,
    required this.preferredSize,
  });

  final double searchBarHeight;
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(" SearchBar"),
              duration: Duration(milliseconds: 700),
            ),
          );
        },
        borderRadius: BorderRadius.circular(30),
        child: Ink(
          height: searchBarHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          child: Row(
            children: [
              const SizedBox(width: 20),
              Icon(
                Icons.search_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: preferredSize.height * 0.46,
              ),
              const SizedBox(width: 10),
              Text(
                "Search Food Item ",
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.primary,
                ),
                // style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18,fontFamily:  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
