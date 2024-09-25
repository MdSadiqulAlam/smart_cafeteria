import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/empty_screen.dart';
import 'package:smart_cafeteria/pages/authentication/login/login.dart';
import 'package:smart_cafeteria/pages/notification/notification.dart';
import 'package:smart_cafeteria/pages/search_item/search_item.dart';

// class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
//   const MyAppbar({
//     super.key,
//     // this.currentPage,
//     this.pageTitle = "",
//     this.showTitle = false,
//     this.showNotification = false,
//     this.viewProfile = false,
//     this.viewOption = false,
//     this.leadingBackArrow = true,
//     this.titlePadding = true,
//   });
//
//   // final int? currentPage;
//   final String? pageTitle;
//   final bool showTitle;
//   final bool showNotification;
//   final bool viewProfile;
//   final bool viewOption;
//   final bool leadingBackArrow;
//   final bool titlePadding;
//
//   @override
//   Widget build(BuildContext context) {
//     // final controller = Get.put(UserController());
//     String? networkImage;
//     final currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser != null) networkImage = currentUser.photoURL;
//
//     return AppBar(
//       automaticallyImplyLeading: leadingBackArrow,
//       surfaceTintColor: getColorScheme(context).secondaryContainer,
//       titleSpacing: 0,
//       title: Visibility(
//         visible: showTitle,
//         child: pageTitle == 'HomePage'
//             ? const MySearchbar()
//             : pageTitle == ""
//                 ? Padding(
//                     padding: EdgeInsets.only(left: titlePadding ? 30 : 0),
//                     // child: Text(pageTitle!, style: TextStyle(fontSize: 24, color: getColorScheme(context).primary)),
//                     child: Row(
//                       children: [
//                         SizedBox(height: 30, width: 30, child: Image.asset('assets/logos/mist_logo.png')),
//                         const SizedBox(width: 12),
//                         Text('MIST Cafeteria', style: TextStyle(fontSize: 24, color: getColorScheme(context).primary)),
//                       ],
//                     ),
//                   )
//                 : Padding(
//                     padding: EdgeInsets.only(left: titlePadding ? 30 : 0),
//                     child: Text(pageTitle!, style: TextStyle(fontSize: 24, color: getColorScheme(context).primary)),
//                   ),
//       ),
//       actions: [
//         if (showNotification)
//           IconButton(
//             onPressed: () {
//               Get.to(() => const NotificationScreen());
//             },
//             icon: Icon(Icons.notifications_none, color: getColorScheme(context).primary, size: 27),
//             tooltip: "Notifications",
//           ),
//         if (viewProfile)
//           PopupMenuButton<String>(
//             elevation: 7,
//             padding: const EdgeInsets.all(0),
//             // icon: Icon(Icons.account_circle, color: getColorScheme(context).primary, size: 34),
//             icon: networkImage == null
//                 ? Icon(Icons.account_circle, color: getColorScheme(context).primary, size: 34)
//                 : CircleAvatar(
//                     radius: 18,
//                     child: ClipOval(child: CachedNetworkImage(imageUrl: networkImage, height: 32, width: 32, fit: BoxFit.cover)),
//                   ),
//             onSelected: (value) {
//               if (value == 'profile') {
//                 Get.to(() => const LoginScreen());
//               }
//               // else if (value == 'settings') {
//               //   Get.to(()=>const EmptyScreen());
//               // }
//             },
//             itemBuilder: (BuildContext context) => [
//               const PopupMenuItem(
//                   value: 'profile', child: SizedBox(width: 100, child: Text('View Profile', style: TextStyle(fontSize: 16)))),
//               // const PopupMenuItem(
//               //   value: 'settings',
//               //   child: SizedBox(width: 100, child: Text('Settings', style: TextStyle(fontSize: 16))),
//               // ),
//             ],
//           ),
//         if (viewOption)
//           IconButton(
//             onPressed: () => Get.to(() => const EmptyScreen()),
//             tooltip: "Options",
//             style: IconButton.styleFrom(padding: const EdgeInsets.all(0)),
//             icon: Icon(Icons.more_vert_rounded, color: getColorScheme(context).primary, size: 25),
//           ),
//         const SizedBox(width: 15),
//       ],
//     );
//   }
//
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
//
class MySearchbar extends StatelessWidget {
  const MySearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: InkWell(
        onTap: () => Get.to(() => const SearchItem()),
        borderRadius: BorderRadius.circular(30),
        child: Ink(
          height: 42,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: getColorScheme(context).secondaryContainer),
          child: Row(
            children: [
              const SizedBox(width: 20),
              Icon(Icons.search_rounded, color: getColorScheme(context).primary, size: 26),
              const SizedBox(width: 10),
              Text("Search Food Item", style: GoogleFonts.roboto(fontSize: 18, color: getColorScheme(context).primary)),
            ],
          ),
        ),
      ),
    );
  }
}



class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({
    super.key,
    this.pageTitle = "",
    this.showTitle = false,
    this.showNotification = false,
    this.viewProfile = false,
    this.viewOption = false,
    this.leadingBackArrow = true,
    this.titlePadding = true,
  });

  final String? pageTitle;
  final bool showTitle;
  final bool showNotification;
  final bool viewProfile;
  final bool viewOption;
  final bool leadingBackArrow;
  final bool titlePadding;

  @override
  Widget build(BuildContext context) {
        String? networkImage;
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) networkImage = currentUser.photoURL;
    return AppBar(
      automaticallyImplyLeading: leadingBackArrow,
      surfaceTintColor: getColorScheme(context).secondaryContainer,
      titleSpacing: 0,
      title: Visibility(
        visible: showTitle,
        child: pageTitle == 'HomePage'
            ? const MySearchbar()
            : pageTitle == ""
            ? Padding(
          padding: EdgeInsets.only(left: titlePadding ? 30 : 0),
          child: Row(
            children: [
              SizedBox(height: 30, width: 30, child: Image.asset('assets/logos/mist_logo.png')),
              const SizedBox(width: 12),
              Text('MIST Cafeteria', style: TextStyle(fontSize: 24, color: getColorScheme(context).primary)),
            ],
          ),
        )
            : Padding(
          padding: EdgeInsets.only(left: titlePadding ? 30 : 0),
          child: Text(pageTitle!, style: TextStyle(fontSize: 24, color: getColorScheme(context).primary)),
        ),
      ),
      actions: [
        if (showNotification)
          IconButton(
            onPressed: () {
              Get.to(() => const NotificationScreen());
            },
            icon: Icon(Icons.notifications_none, color: getColorScheme(context).primary, size: 27),
            tooltip: "Notifications",
          ),
        if (viewProfile)
          PopupMenuButton<String>(
            elevation: 7,
            padding: const EdgeInsets.all(0),
            icon: networkImage == null
                ? Icon(Icons.account_circle, color: getColorScheme(context).primary, size: 34)
                : CircleAvatar(
              radius: 18,
              child: ClipOval(child: CachedNetworkImage(imageUrl: networkImage, height: 32, width: 32, fit: BoxFit.cover)),
            ),
            onSelected: (value) {
              if (value == 'profile') {
                Get.to(() => const LoginScreen());
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                  value: 'profile', child: SizedBox(width: 100, child: Text('View Profile', style: TextStyle(fontSize: 16)))),
            ],
          ),
        if (viewOption)
          IconButton(
            onPressed: () => Get.to(() => const EmptyScreen()),
            tooltip: "Options",
            style: IconButton.styleFrom(padding: const EdgeInsets.all(0)),
            icon: Icon(Icons.more_vert_rounded, color: getColorScheme(context).primary, size: 25),
          ),
        const SizedBox(width: 15),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
