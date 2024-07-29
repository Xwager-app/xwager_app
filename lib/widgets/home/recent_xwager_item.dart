import 'package:flutter/material.dart';
import 'package:xwager/models/xwager.dart';

class RecentXwagerItem extends StatefulWidget {
  const RecentXwagerItem(
      {super.key, required this.item, required this.itemIndex});

  final Xwager item;
  final int itemIndex;

  @override
  State<RecentXwagerItem> createState() {
    return _RecentXwagerItemState();
  }
}

class _RecentXwagerItemState extends State<RecentXwagerItem>
    with SingleTickerProviderStateMixin {
  // the late tells dart that this variable does not have a value at the beginning but will have a value when being used.
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        lowerBound: 0,
        upperBound: 1);

    _startAnimationWithDelay();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startAnimationWithDelay() async {
    await Future.delayed(Duration(milliseconds: widget.itemIndex * 150));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position:
          Tween(begin: const Offset(0, 0.8), end: const Offset(0, 0)).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
      ),
      child: FadeTransition(
        opacity: CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOut,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context)
                    .colorScheme
                    .onSecondaryContainer
                    .withOpacity(0.3),
              ),
              key: ValueKey(widget.item.id),
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
                    child: Image.asset(widget.item.imgPath),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.item.wagerState == WagerState.win
                            ? const Color.fromRGBO(4, 193, 0, 1)
                            : widget.item.wagerState == WagerState.active
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
                  widget.item.category.name[0].toUpperCase() +
                      widget.item.category.name.substring(1),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16, color: Colors.black),
                ),
                subtitle: Text(
                  '${widget.item.users[0]}...',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 10, color: Colors.black),
                ),
                trailing: Text(
                  '${widget.item.wagerState == WagerState.win ? '+' : widget.item.wagerState == WagerState.active ? '' : '-'}\$${widget.item.amount}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: widget.item.wagerState == WagerState.win
                            ? const Color.fromRGBO(4, 193, 0, 1)
                            : widget.item.wagerState == WagerState.active
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
      ),
    );
  }
}
