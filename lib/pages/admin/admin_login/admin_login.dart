import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/role_based_enter/role_based_enter_screen.dart';

import '../admin_root_page.dart';
import 'components/admin_login_form.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColorScheme(context).surfaceContainer,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 20,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),
                child: Container(
                  width: getScreenWidth(context) * 0.87,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                  child: Column(
                    children: [
                      /// image, title
                      Image.asset(
                        'assets/logos/smart_cafeteria_transparent.png',
                        height: getScreenWidth(context) * 0.3,
                        width: getScreenWidth(context) * 0.3 * 0.88,
                      ),
                      const SizedBox(height: 5),
                      Text('Admin Sign in', style: getTextTheme(context).headlineMedium),
                      Text('with email, password', style: getTextTheme(context).titleMedium),

                      /// form
                      const AdminLoginForm(),
                    ],
                  ),
                ),
              ),
            ),
          ),

          /// got to user login
          Positioned(
            bottom: 10,
            right: 10,
            child: TextButton(
              onPressed: () {
                /// todo: get.ofall
                Get.off(const RoleBasedEnterScreen());
              },
              child: const Text('Enter as User', style: TextStyle(fontSize: 16, decoration: TextDecoration.underline)),
            ),
          ),
        ],
      ),
    );
  }
}
