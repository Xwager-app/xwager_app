import "package:flutter/material.dart";

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() {
    return _Welcome();
  }
}

class _Welcome extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Welcome')],
      ),
    );
  }
}
