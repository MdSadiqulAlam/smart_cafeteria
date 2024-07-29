import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/role_based_enter_screen.dart';

import '../../../components/form_components.dart';
import 'components/user_login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColorScheme(context).surfaceContainer,
      body: Stack(
        children: [
          const BackgroundCircle(),
          Center(
            child: SingleChildScrollView(
              // physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 20,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                child: Container(
                  width: getScreenWidth(context) * 0.82,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                  child: Column(
                    children: [
                      ///image
                      Image.asset(
                        'assets/logos/smart_cafeteria_transparent.png',
                        height: getScreenWidth(context) * 0.3,
                        width: getScreenWidth(context) * 0.3 * 0.88,
                      ),

                      /// form title
                      Text('Sign in', style: getTextTheme(context).headlineMedium),
                      Text('with email, password', style: getTextTheme(context).titleMedium),

                      /// sign in form
                      const UserLogInForm(),
                      // Container(height: 20, color: Colors.red),

                      /// divider
                      const FormDivider(dividerText: 'Or Sign In with'),

                      /// other login options
                      const SizedBox(height: 5),
                      const OtherLogInOptions(),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: TextButton(
              onPressed: () {
                /// todo: get.ofall
                Get.off(const RoleBasedEnterScreen());
              },
              child: const Text('Enter as Admin', style: TextStyle(fontSize: 16, decoration: TextDecoration.underline)),
            ),
          ),
        ],
      ),
    );
  }
}
