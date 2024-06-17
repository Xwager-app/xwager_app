import "dart:async";

import "package:flutter/material.dart";
import "package:xwager/screens/icon_screen.dart";

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const IconScreen()));
    });

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
