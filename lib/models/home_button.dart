import 'package:flutter/material.dart';

class HomeButton {
  HomeButton({
    required this.icon,
    required this.text1,
    required this.text2,
    this.url,
    required this.navigateToScreen,
  });

  final Widget icon;
  final String text1;
  final String text2;
  final String? url;
  final void Function(BuildContext context) navigateToScreen;

  void navigate(BuildContext context) {
    // Navigator.push
    navigateToScreen(context);
  }
}
