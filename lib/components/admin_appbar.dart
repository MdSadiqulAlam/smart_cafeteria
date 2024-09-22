import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/data/repositories/authentication/authentication_repository.dart';
import 'package:smart_cafeteria/pages/role_based_enter/role_based_enter_screen.dart';

class AdminAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AdminAppbar({
    super.key,
    // this.currentPage,
    this.pageTitle = "",
    this.showTitle = false,
    // this.showNotification = false,
    // this.viewProfile = false,
    this.viewOption = false,
    this.leadingBackArrow = true,
    this.titlePadding = true,
  });

  // final int? currentPage;
  final String? pageTitle;
  final bool showTitle;

  // final bool showNotification;
  // final bool viewProfile;
  final bool viewOption;
  final bool leadingBackArrow;
  final bool titlePadding;

  @override
  Widget build(BuildContext context) {
    final deviceStorage = GetStorage();
    // final controller = Get.put(UserController());
    // String? networkImage;
    // final currentUser = FirebaseAuth.instance.currentUser;
    // if (currentUser != null) networkImage = currentUser.photoURL;

    return AppBar(
      automaticallyImplyLeading: leadingBackArrow,
      surfaceTintColor: getColorScheme(context).secondaryContainer,
      titleSpacing: 0,
      title: Visibility(
        visible: showTitle,
        child: pageTitle == ""
            ? Padding(
                padding: EdgeInsets.only(left: titlePadding ? 30 : 0),
                // child: Text(pageTitle!, style: TextStyle(fontSize: 24, color: getColorScheme(context).primary)),
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
        // if (showNotification)
        //   IconButton(
        //     onPressed: () {
        //       Get.to(() => const NotificationScreen());
        //     },
        //     icon: Icon(Icons.notifications_none, color: getColorScheme(context).primary, size: 27),
        //     tooltip: "Notifications",
        //   ),
        // if (viewProfile)
        //   PopupMenuButton<String>(
        //     elevation: 7,
        //     padding: const EdgeInsets.all(0),
        //     // icon: Icon(Icons.account_circle, color: getColorScheme(context).primary, size: 34),
        //     icon: networkImage == null
        //         ? Icon(Icons.account_circle, color: getColorScheme(context).primary, size: 34)
        //         : CircleAvatar(
        //       radius: 18,
        //       child: ClipOval(child: CachedNetworkImage(imageUrl: networkImage, height: 32, width: 32, fit: BoxFit.cover)),
        //     ),
        //     onSelected: (value) {
        //       if (value == 'profile') {
        //         Get.to(() => const LoginScreen());
        //       }
        //       // else if (value == 'settings') {
        //       //   Get.to(()=>const EmptyScreen());
        //       // }
        //     },
        //     itemBuilder: (BuildContext context) => [
        //       const PopupMenuItem(
        //           value: 'profile', child: SizedBox(width: 100, child: Text('View Profile', style: TextStyle(fontSize: 16)))),
        //       // const PopupMenuItem(
        //       //   value: 'settings',
        //       //   child: SizedBox(width: 100, child: Text('Settings', style: TextStyle(fontSize: 16))),
        //       // ),
        //     ],
        //   ),
        if (viewOption)
          IconButton(
            onPressed: () async {
              await Get.dialog(
                AlertDialog(
                  title: const Text('Logout Confirmation'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () async {
                        await AuthenticationRepository.instance.logout();
                        // Store admin logout status in GetStorage
                        await deviceStorage.write('adminLoggedIn', false);
                        Get.offAll(() => const RoleBasedEnterScreen());
                      },
                      child: const Text('Yes'),
                    ),
                  ],
                ),
              );
            },
            tooltip: "Options",
            style: IconButton.styleFrom(padding: const EdgeInsets.all(0)),
            icon: Icon(Icons.logout_rounded, color: getColorScheme(context).primary, size: 25),
          ),
        // const SizedBox(width: 15),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}