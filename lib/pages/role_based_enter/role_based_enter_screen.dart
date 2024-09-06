import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/admin/admin_login/admin_login.dart';
import 'package:smart_cafeteria/pages/root_page.dart';

class RoleBasedEnterScreen extends StatelessWidget {
  const RoleBasedEnterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: getScreenHeight(context),
        width: getScreenWidth(context),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFC8CEA4),
              Color(0xFFC9D4A8),
              Color(0xFFBCD4A3),
              Color(0xFFA3D6A2),
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 150),
            Image.asset(
              'assets/logos/smart_cafeteria_transparent.png',
              height: getScreenWidth(context) * 0.55,
              width: getScreenWidth(context) * 0.55,
            ),
            const SizedBox(height: 20),
            Text(
              'Select Your Role',
              style: getTextTheme(context).headlineLarge?.copyWith(
                    color: getColorScheme(context).onPrimaryContainer.withOpacity(0.75),
                    fontWeight: FontWeight.bold,
                    // fontSize: 28,
                  ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: getScreenWidth(context) * 0.45,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // Get.offAll(const EmptyScreen());
                  Get.to(()=>const AdminLogin());
                  // Get.put(AuthenticationRepository());
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                ),
                child: const Text('Admin', style: TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: getScreenWidth(context) * 0.45,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // Get.offAll(RootPage());
                  Get.to(()=>RootPage());
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                ),
                child: const Text('User', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
