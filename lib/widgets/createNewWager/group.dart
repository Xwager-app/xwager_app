import 'package:flutter/material.dart';
import 'package:xwager/screens/FPL/welcome_to_fpl.dart';

class Group extends StatelessWidget {
  const Group({super.key});
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: deviceHeight * 0.8,
      decoration: const BoxDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 300,
            child: Column(
              children: [
                Text(
                  'Group Xwager: FANTASY PREMIER LEAGUE',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color.fromRGBO(0, 0, 0, 1), fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Connect your FPL account and create a league contest with anyone.',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color.fromRGBO(17, 17, 17, 1), fontSize: 12),
                )
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            visualDensity: VisualDensity.compact,
            color: const Color.fromRGBO(20, 27, 52, 1),
            iconSize: 32,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const WelcomeToFPL(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_right_alt),
          )
        ],
      ),
    );
  }
}
