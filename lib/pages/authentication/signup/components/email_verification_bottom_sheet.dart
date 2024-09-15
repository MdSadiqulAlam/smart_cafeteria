import 'package:flutter/material.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/pages/authentication/signup/components/email_verification_controller.dart';

Future<void> emailVerificationBottomSheet({required BuildContext context, required String email_}) async {
  final controller = Get.put(EmailVerificationController());
  showModalBottomSheet<void>(
    context: context,
    isDismissible: false,
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
            Text('Verify your email address!', style: getTextTheme(context).headlineSmall?.copyWith(fontWeight: FontWeight.w600)),

            /// body
            const SizedBox(height: 30),
            const Text('A verification email has been sent to :', style: TextStyle(fontSize: 17)),

            /// email
            const SizedBox(height: 3),
            Text(email_, style: getTextTheme(context).titleMedium?.copyWith(fontWeight: FontWeight.w600, fontSize: 19)),

            /// footer
            const Spacer(),
            const Text('Please, verify the email address before continuing.',
                style: TextStyle(fontSize: 15), textAlign: TextAlign.justify),

            /// buttons
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                /// resend button
                SizedBox(
                  width: getScreenWidth(context) * 0.42,
                  child: FilledButton.tonal(
                    onPressed: () => controller.sendEmailVerification(),
                    child: const Text('Resend Email', style: TextStyle(fontSize: 17)),
                  ),
                ),

                /// continue button
                SizedBox(
                  width: getScreenWidth(context) * 0.42,
                  child: FilledButton(
                    onPressed: () => controller.checkEmailVerificationStatus(),
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

Future<void> emailVerificationAlert(BuildContext context) async {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Email unverified!'),
        content: const Text('Please verify the provided email before continuing'),
        actions: <Widget>[FilledButton(onPressed: () => Get.back(), child: const Text('OK'))],
      );
    },
  );
}
