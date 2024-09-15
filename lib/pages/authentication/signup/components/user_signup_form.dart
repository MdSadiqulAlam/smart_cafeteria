import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/authentication/signup/components/signup_controller.dart';
import 'package:smart_cafeteria/utilities/validators.dart';

class UserSignupForm extends StatelessWidget {
  const UserSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// Profile Picture Upload
          Obx(() => GestureDetector(
                onTap: () => controller.pickProfileImage(),
                child: CircleAvatar(
                  radius: 70,
                  // ? const AssetImage('assets/images/default_avatar.png')
                  backgroundImage: controller.selectedImagePath.value.isEmpty
                      ? const AssetImage('assets/images/default_avatar.png')
                      : FileImage(File(controller.selectedImagePath.value)) as ImageProvider,
                  child: const Icon(Icons.camera_alt_outlined),
                ),
              )),
          const SizedBox(height: 30),

          /// name fields
          Row(
            children: [
              /// first name
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => MyValidator.validateEmptyText('First Name', value),
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
                  controller: controller.lastName,
                  validator: (value) => MyValidator.validateEmptyText('Last Name', value),
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
            controller: controller.email,
            validator: (value) => MyValidator.validateEmail(value),
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
            controller: controller.phoneNumber,
            validator: (value) => MyValidator.validatePhoneNumber(value),
            expands: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Phone Number',
              prefixIcon: const Icon(Icons.phone_outlined),
            ),
          ),

          /// password
          const SizedBox(height: 16),
          Obx(
            () => TextFormField(
              controller: controller.createPassword,
              validator: (value) => MyValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              expands: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Create Password',
                prefixIcon: const Icon(Icons.password_rounded),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                ),
              ),
            ),
          ),

          /// confirm password
          // const SizedBox(height: 16),
          // TextFormField(
          //   controller: controller.confirmPassword,
          //   expands: false,
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          //     labelText: 'Confirm Password',
          //     prefixIcon: const Icon(Icons.password_rounded),
          //     suffixIcon: const Icon(Icons.visibility_off_outlined),
          //   ),
          // ),

          /// signup button
          const SizedBox(height: 50),
          SizedBox(
            width: getScreenWidth(context) * 0.7,
            child: FilledButton(
              onPressed: () {
                /// bottom sheet
                // emailVerificationBottomSheet(context: context, email_: 'sadiqul@gmail.com');
                controller.signup(context);
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
