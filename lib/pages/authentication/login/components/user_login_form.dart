import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/pages/authentication/forgot_password/forgot_password.dart';
import 'package:smart_cafeteria/pages/authentication/signup/signup.dart';
import 'package:smart_cafeteria/pages/root_page.dart';

import '../../../../config/get_config.dart';
import '../../../empty_screen.dart';

class UserLogInForm extends StatelessWidget {
  const UserLogInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// email
          const SizedBox(height: 15),
          SizedBox(
            width: getScreenWidth(context) * 0.72,
            child: TextFormField(
              decoration: InputDecoration(
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
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                labelText: 'Password',
                suffixIcon: Icon(Icons.visibility_off_outlined, size: 20),
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
            onPressed: () {
              /// todo : get.ofall
              Get.to(() => const RootPage());
            },
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
