import 'package:flutter/material.dart';
import 'package:smart_cafeteria/components/appbar.dart';
import 'package:smart_cafeteria/components/form_components.dart';
import 'package:smart_cafeteria/config/get_config.dart';

import 'components/user_signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
            Text('Let\'s Create Account', style: getTextTheme(context).headlineMedium?.copyWith(fontWeight: FontWeight.w600)),

            /// SignUp form
            const SizedBox(height: 30),
            const UserSignupForm(),

            /// divider
            const SizedBox(height: 150),
            const FormDivider(dividerText: 'Or SignUp with'),

            /// other login options
            const SizedBox(height: 5),
            const OtherLogInOptions(),
          ],
        ),
      ),
    );
  }
}
