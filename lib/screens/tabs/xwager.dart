import 'package:flutter/material.dart';
import 'package:xwager/widgets/createNewWager/create_new_wager.dart';

class XwagerScreen extends StatelessWidget {
  const XwagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, child: const CreateNewWager());
  }
}
