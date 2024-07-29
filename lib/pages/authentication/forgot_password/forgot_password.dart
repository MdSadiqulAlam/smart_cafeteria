import 'package:flutter/material.dart';
import 'package:smart_cafeteria/components/appbar.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/authentication/forgot_password/components/password_reset_bottom_sheet.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// title
            Text('Forgot Password', style: getTextTheme(context).headlineMedium?.copyWith(fontWeight: FontWeight.w600)),

            /// subtitle
            const SizedBox(height: 10),
            const Text('Don\'t worry. We have got your back!', style: TextStyle(fontSize: 16)),

            /// body
            const SizedBox(height: 25),
            const Text(
              'Please, enter your email address and a password reset link will be sent to you shortly.',
              style: TextStyle(fontSize: 17),
              textAlign: TextAlign.justify,
            ),

            /// email text field
            const SizedBox(height: 30),
            TextFormField(
              expands: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Your E-Mail',
                prefixIcon: const Icon(Icons.email_outlined),
              ),
            ),

            /// continue button
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton(
                onPressed: () {
                  /// bottom sheet
                  passwordResetBottomSheet(context: context, email_: 'sadiqul@gmail.com');
                },
                style: FilledButton.styleFrom(backgroundColor: getColorScheme(context).primary.withOpacity(0.9)),
                child: const Text('Send Link', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
