import 'package:flutter/material.dart';
import 'package:smart_cafeteria/components/appbar.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(showTitle: true, pageTitle: 'New Page'),
      body: Container(color: Colors.greenAccent),
    );
  }
}
