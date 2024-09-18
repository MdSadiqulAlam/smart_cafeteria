import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/get_config.dart';
import '../../../../utilities/validators.dart';
import 'admin_login_controller.dart';

class AdminLoginForm extends StatelessWidget {
  const AdminLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminLoginController());

    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          /// email
          const SizedBox(height: 25),
          SizedBox(
            width: getScreenWidth(context) * 0.75,
            child: TextFormField(
              controller: controller.email,
              validator: (value) => MyValidator.validateEmail(value),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                labelText: 'Email',
                suffixIcon: const Icon(Icons.report_gmailerrorred, size: 22),
              ),
            ),
          ),

          ///password
          const SizedBox(height: 10),
          SizedBox(
            width: getScreenWidth(context) * 0.75,
            child: Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => MyValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.hidePassword.value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      size: 22,
                    ),
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  ),
                ),
              ),
            ),
          ),

          ///sign in button
          const SizedBox(height: 50),
          Align(
            alignment: Alignment.bottomRight,
            child: FilledButton(
              onPressed: () => controller.emailAndPasswordAdminSignIn(),
              style: FilledButton.styleFrom(
                backgroundColor: getColorScheme(context).primary.withOpacity(0.9),
              ),
              child: const Text('Sign In', style: TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
