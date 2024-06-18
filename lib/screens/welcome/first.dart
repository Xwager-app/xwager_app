import "dart:async";

import "package:flutter/material.dart";
import "package:xwager/screens/welcome/icon_screen.dart";
// import "package:xwager/screens/welcome/icon_screen.dart";

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      // Check if the widget is still mounted before navigating

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const IconScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Timer(const Duration(seconds: 1), () {
    //   print('Yes');

    //   Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (context) => const IconScreen()));
    // });

    // Navigate to the SecondScreen after 3 seconds
    // Future.delayed(const Duration(seconds: 1), () {
    //   print("yes");
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => const IconScreen()),
    //   );
    // });

    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'assets/images/logo.png',
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
