import 'package:flutter/material.dart';
import 'package:xwager/data/wager_categories.dart';
import 'package:xwager/models/xwager.dart';

class Head2Head extends StatelessWidget {
  const Head2Head(
      {super.key, this.categoryItem, required this.onChooseCategory});

  final XwagerCategory? categoryItem;
  final Function(XwagerCategory category) onChooseCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'Note: Xwager will charge 5% per Xwager created',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 12),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 25),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context).colorScheme.onPrimary, width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Select Category',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 5,
                    alignment: WrapAlignment.center,
                    children: [
                      ...wagerCategories.map((category) => OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: category.category ==
                                        categoryItem
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                side: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary)),
                            onPressed: () {
                              onChooseCategory(category.category);
                            },
                            child: Text(
                              category.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: category.category == categoryItem
                                          ? Colors.white
                                          : Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // InkWell(
          //   onTap: () {
          //     // Handle tap
          //   },
          // child: const Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text('Add Hashtag'),
          //       Icon(Icons.arrow_drop_down_circle_sharp)
          //     ]),
          // )
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(229, 235, 240, 1),
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.black),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add Hashtag',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
