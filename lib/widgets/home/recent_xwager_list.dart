import 'package:flutter/material.dart';
import 'package:xwager/data/xwagers.dart';
import 'package:xwager/widgets/home/recent_xwager_item.dart';

class RecentXwagerList extends StatelessWidget {
  const RecentXwagerList({super.key});

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset('assets/images/empty.png'),
        const SizedBox(
          height: 10,
        ),
        Text(
          textAlign: TextAlign.center,
          'You currently do not have any recent wagers',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        )
      ]),
    );

    if (xWagers.isNotEmpty) {
      mainContent = AnimatedList(
        padding: const EdgeInsets.all(0),
        initialItemCount: xWagers.length,
        itemBuilder: (ctx, index, animation) =>
            RecentXwagerItem(item: xWagers[index], itemIndex: index),
      );
    }

    return Container(
        height: 250, padding: const EdgeInsets.all(0), child: mainContent);
  }
}
