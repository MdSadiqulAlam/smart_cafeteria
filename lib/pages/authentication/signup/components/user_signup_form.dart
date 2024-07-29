import 'package:flutter/material.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/authentication/signup/components/email_verification_bottom_sheet.dart';

class UserSignupForm extends StatelessWidget {
  const UserSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              /// first name
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: 'First Name',
                    prefixIcon: const Icon(Icons.person_outline_rounded),
                  ),
                ),
              ),

              /// last name
              const SizedBox(width: 15),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: 'Last Name',
                    prefixIcon: const Icon(Icons.person_outline_rounded),
                  ),
                ),
              ),
            ],
          ),

          /// email
          const SizedBox(height: 16),
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'E-Mail',
              prefixIcon: const Icon(Icons.email_outlined),
            ),
          ),

          /// phone
          const SizedBox(height: 16),
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Phone Number',
              prefixIcon: const Icon(Icons.phone_outlined),
            ),
          ),

          /// password
          const SizedBox(height: 16),
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Create Password',
              prefixIcon: const Icon(Icons.password_rounded),
              suffixIcon: const Icon(Icons.visibility_off_outlined),
            ),
          ),

          /// confirm password
          const SizedBox(height: 16),
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Confirm Password',
              prefixIcon: const Icon(Icons.password_rounded),
              suffixIcon: const Icon(Icons.visibility_off_outlined),
            ),
          ),

          /// signup button
          const SizedBox(height: 40),
          SizedBox(
            width: getScreenWidth(context) * 0.7,
            child: FilledButton(
              onPressed: () {
                /// bottom sheet
                emailVerificationBottomSheet(context: context, email_: 'sadiqul@gmail.com');
              },
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                backgroundColor: getColorScheme(context).primary.withOpacity(0.9),
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
              child: const Text('Create Account', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
