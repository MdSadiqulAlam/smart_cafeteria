import 'package:flutter/material.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/pages/authentication/login/login.dart';

Future<void> passwordResetBottomSheet({required BuildContext context, required String email_}) async {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: getScreenHeight(context) * 0.4,
        width: getScreenWidth(context),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// title
            Text('Password Reset Email Sent!', style: getTextTheme(context).headlineSmall?.copyWith(fontWeight: FontWeight.w600)),

            /// body
            const SizedBox(height: 30),
            const Text('A email containing password reset link has been sent to :', style: TextStyle(fontSize: 17)),

            /// email
            const SizedBox(height: 10),
            Text(email_, style: getTextTheme(context).titleMedium?.copyWith(fontWeight: FontWeight.w600, fontSize: 19)),

            /// footer
            const Spacer(),
            // const Text('Please, verify the email address before continuing.',
            //     style: TextStyle(fontSize: 15), textAlign: TextAlign.justify),

            /// buttons
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                /// resend button
                SizedBox(
                  width: getScreenWidth(context) * 0.42,
                  child: FilledButton.tonal(
                    onPressed: () {},
                    child: const Text('Resend Email', style: TextStyle(fontSize: 17)),
                  ),
                ),

                /// continue button
                SizedBox(
                  width: getScreenWidth(context) * 0.42,
                  child: FilledButton(
                    onPressed: () {
                      Get.off(() => const LoginScreen());
                    },
                    child: const Text('Continue', style: TextStyle(fontSize: 17)),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
