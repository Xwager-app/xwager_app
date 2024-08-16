import 'package:flutter/material.dart';
import 'package:xwager/models/xwager.dart';
import 'package:xwager/widgets/createNewWager/head_2_head.dart';

class CreateNewWager extends StatefulWidget {
  const CreateNewWager({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CreateNewWagerState();
  }
}

class _CreateNewWagerState extends State<CreateNewWager> {
  XwagerType xwagerType = XwagerType.head2Head;

  XwagerCategory? _xwagerCategory;

  void _onChooseCategory(XwagerCategory category) {
    setState(() {
      _xwagerCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            color: Colors.white,
            width: double.infinity,
            child: Container(
              clipBehavior: Clip.hardEdge,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).colorScheme.onPrimary, width: 1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: xwagerType == XwagerType.head2Head
                            ? Theme.of(context).colorScheme.onPrimary
                            : Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          xwagerType = XwagerType.head2Head;
                        });
                      },
                      child: Text(
                        'Head-2-Head',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: xwagerType == XwagerType.head2Head
                                  ? Colors.white
                                  : Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: xwagerType == XwagerType.group
                            ? Theme.of(context).colorScheme.onPrimary
                            : Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          xwagerType = XwagerType.group;
                        });
                      },
                      child: Text(
                        'Group',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: xwagerType == XwagerType.group
                                  ? Colors.white
                                  : Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Head2Head(
            categoryItem: _xwagerCategory,
            onChooseCategory: _onChooseCategory,
          )
        ],
      ),
    );
  }
}
