import 'package:flutter/material.dart';
import 'package:xwager/data/xwagers.dart';
import 'package:xwager/models/xwager.dart';

class RecentXwagerList extends StatefulWidget {
  const RecentXwagerList({super.key});

  @override
  State<RecentXwagerList> createState() {
    return _RecentXwagerListState();
  }
}

class _RecentXwagerListState extends State<RecentXwagerList> {
  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Column(children: [
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
      mainContent = ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: xWagers.length,
        itemBuilder: (ctx, index) => Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context)
                    .colorScheme
                    .onSecondaryContainer
                    .withOpacity(0.3),
              ),
              key: ValueKey(xWagers[index].id),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                visualDensity: VisualDensity.compact,
                leading: Stack(children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset(xWagers[index].imgPath),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: xWagers[index].wagerState == WagerState.win
                            ? const Color.fromRGBO(4, 193, 0, 1)
                            : xWagers[index].wagerState == WagerState.active
                                ? Theme.of(context).colorScheme.onPrimary
                                : const Color.fromRGBO(193, 0, 0, 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      width: 10,
                      height: 10,
                    ),
                  )
                ]),
                title: Text(
                  xWagers[index].category.name[0].toUpperCase() +
                      xWagers[index].category.name.substring(1),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16, color: Colors.black),
                ),
                subtitle: Text(
                  '${xWagers[index].users[0]}...',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 10, color: Colors.black),
                ),
                trailing: Text(
                  '${xWagers[index].wagerState == WagerState.win ? '+' : xWagers[index].wagerState == WagerState.active ? '' : '-'}\$${xWagers[index].amount}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: xWagers[index].wagerState == WagerState.win
                            ? const Color.fromRGBO(4, 193, 0, 1)
                            : xWagers[index].wagerState == WagerState.active
                                ? Theme.of(context).colorScheme.onPrimary
                                : const Color.fromRGBO(193, 0, 0, 1),
                      ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      );
    }

    return Container(
        height: 250, padding: const EdgeInsets.all(0), child: mainContent);
  }
}
