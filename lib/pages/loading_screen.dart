import 'package:flutter/material.dart';

import '../config/get_config.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBEC9BE),
      body: Container(
        height: getScreenHeight(context),
        width: getScreenWidth(context),
        // color: const Color(0xFFBEC9BE),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(color: Color(0xFF2E3830)),
      ),
    );
  }
}
