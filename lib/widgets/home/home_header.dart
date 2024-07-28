import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimary, width: 2),
                  borderRadius: BorderRadius.circular(100)),
              child: Image.asset(
                'assets/images/user.png',
                scale: 0.2,
                width: 38,
                height: 38,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Hey, @Clarkkelvin',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary, fontSize: 16),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.verified,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              visualDensity: VisualDensity.compact,
              icon: Icon(
                Icons.notifications_none,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            IconButton(
              onPressed: () {},
              visualDensity: VisualDensity.compact,
              icon: Icon(
                Icons.more_horiz,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
