// import "dart:async";

import "dart:async";

import "package:flutter/material.dart";
import "package:xwager/screens/welcome/welcome.dart";

class IconScreen extends StatefulWidget {
  const IconScreen({super.key});

  @override
  State<IconScreen> createState() => _IconScreenState();
}

class _IconScreenState extends State<IconScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      // Check if the widget is still mounted before navigating

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (ctx) => const Welcome()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'assets/images/logo-2.png',
          color: Colors.white,
          width: 250,
          height: 250,
        ),
        const CircularProgressIndicator(
          strokeWidth: 2,
        )
      ]),
    );
  }
}
