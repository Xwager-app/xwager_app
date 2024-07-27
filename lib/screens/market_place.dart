import 'package:flutter/material.dart';

class MarketPlaceScreen extends StatelessWidget {
  const MarketPlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Place'),
      ),
      body: const Center(
        child: Text('Market'),
      ),
    );
  }
}
