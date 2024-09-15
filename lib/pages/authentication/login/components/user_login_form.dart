import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/pages/authentication/forgot_password/forgot_password.dart';
import 'package:smart_cafeteria/pages/authentication/signup/signup.dart';
import 'package:smart_cafeteria/config/get_config.dart';

import '../../../../utilities/validators.dart';
import 'login_controller.dart';

class UserLogInForm extends StatelessWidget {
  const UserLogInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          /// email
          const SizedBox(height: 15),
          SizedBox(
            width: getScreenWidth(context) * 0.72,
            child: TextFormField(
              controller: controller.email,
              validator: (value) => MyValidator.validateEmail(value),
              decoration: const InputDecoration(
                // border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                labelText: 'E-Mail',
                suffixIcon: Icon(Icons.report_gmailerrorred, size: 20),
              ),
            ),
          ),

          ///password
          const SizedBox(height: 5),
          SizedBox(
            width: getScreenWidth(context) * 0.72,
            child: Obx(
              () => TextFormField(
                controller: controller.password,
                // validator: (value) => MyValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  labelText: 'Password',
                  // suffixIcon: Icon(Icons.visibility_off_outlined, size: 20),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon:
                        Icon(controller.hidePassword.value ? Icons.visibility_off_outlined : Icons.visibility_outlined, size: 20),
                  ),
                ),
              ),
            ),
          ),

          /// remember me , forgot pass
          // const SizedBox(height: 3),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     /// remember me
          //     Row( children: [Checkbox(value: true, onChanged: (value) {}), const Text('Remember Me')]),
          //
          //     /// forget pass
          //     TextButton(onPressed: () {}, child: const Text('Forgot Password?',style: TextStyle(fontSize: 13))),
          //   ],
          // ),
          /// forget pass
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => Get.to(() => const ForgotPassword()),
              child: const Text('Forgot Password?', style: TextStyle(fontSize: 13)),
            ),
          ),

          ///sign in button
          const SizedBox(height: 10),
          FilledButton(
            onPressed: () => controller.emailAndPasswordSignIn(),
            style: FilledButton.styleFrom(
              backgroundColor: getColorScheme(context).primary.withOpacity(0.9),
              padding: const EdgeInsets.symmetric(horizontal: 80),
            ),
            child: const Text('Sign In', style: TextStyle(fontSize: 16)),
          ),

          ///create account
          SizedBox(
            height: 25,
            child: TextButton(
              onPressed: () {
                Get.to(() => const SignupScreen());
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              child: const Text('Create an Account?'),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
