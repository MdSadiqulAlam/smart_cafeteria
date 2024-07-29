import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/empty_screen.dart';
import 'package:smart_cafeteria/pages/role_based_enter_screen.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColorScheme(context).surfaceContainer,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 20,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),
                child: Container(
                  width: getScreenWidth(context) * 0.87,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                  child: Column(
                    children: [
                      /// image, title
                      Image.asset(
                        'assets/logos/smart_cafeteria_transparent.png',
                        height: getScreenWidth(context) * 0.3,
                        width: getScreenWidth(context) * 0.3 * 0.88,
                      ),
                      const SizedBox(height: 5),
                      Text('Admin Sign in', style: getTextTheme(context).headlineMedium),
                      Text('with email, password', style: getTextTheme(context).titleMedium),

                      /// form
                      Form(
                        child: Column(
                          children: [
                            /// email
                            const SizedBox(height: 25),
                            SizedBox(
                              width: getScreenWidth(context) * 0.75,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                  labelText: 'Email',
                                  suffixIcon: Icon(Icons.report_gmailerrorred, size: 22),
                                ),
                              ),
                            ),

                            ///password
                            const SizedBox(height: 10),
                            SizedBox(
                              width: getScreenWidth(context) * 0.75,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                  labelText: 'Password',
                                  suffixIcon: Icon(Icons.visibility_off_outlined, size: 22),
                                ),
                              ),
                            ),

                            /// remember me
                            // const SizedBox(height: 3),
                            // Row(
                            //   children: [Checkbox(value: true, onChanged: (value) {}), const Text('Remember')],
                            // ),

                            ///sign in button
                            const SizedBox(height: 50),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: FilledButton(
                                onPressed: () {
                                  /// todo : get.ofall
                                  Get.to(() => EmptyScreen());
                                },
                                style: FilledButton.styleFrom(
                                  backgroundColor: getColorScheme(context).primary.withOpacity(0.9),
                                ),
                                child: const Text('Sign In', style: TextStyle(fontSize: 16)),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
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
              child: const Text('Enter as User', style: TextStyle(fontSize: 16, decoration: TextDecoration.underline)),
            ),
          ),
        ],
      ),
    );
  }
}
