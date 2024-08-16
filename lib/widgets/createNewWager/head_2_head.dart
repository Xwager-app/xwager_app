import 'package:flutter/material.dart';
import 'package:xwager/data/wager_categories.dart';
import 'package:xwager/models/xwager.dart';

class Head2Head extends StatelessWidget {
  const Head2Head(
      {super.key,
      this.categoryItem,
      required this.onChooseCategory,
      required this.formKey,
      required this.titleController,
      required this.termsController});

  final XwagerCategory? categoryItem;
  final Function(XwagerCategory category) onChooseCategory;
  final GlobalKey formKey;
  final TextEditingController titleController;
  final TextEditingController termsController;

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
                                elevation:
                                    category.category == categoryItem ? 2 : 0,
                                shadowColor: category.category == categoryItem
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Colors.white,
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
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Xwager Title',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color.fromRGBO(17, 17, 17, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: titleController,
                        maxLength: 50,
                        decoration: InputDecoration(
                          hintText: 'e.g Fifa Challenge',
                          contentPadding: const EdgeInsets.all(13),
                          hintStyle: const TextStyle(
                            color: Color.fromRGBO(128, 128, 131, 1),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(0, 0, 0, 0.3), width: 1),
                          ),
                          // label: Text(
                          //   'Email Address',
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .bodyMedium!
                          //       .copyWith(
                          //           color:
                          //               Theme.of(context).colorScheme.onPrimary,
                          //           fontSize: 16),
                          // ),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length <= 1) {
                            return 'Please enter wager title';
                          }
                          if (value.trim().length > 50) {
                            return 'Must be at most 50 characters';
                          }
                          return null;
                        },
                        // onSaved: (value) {
                        //   _enteredEmail = value!;
                        // },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Xwager Terms or Conditions',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color.fromRGBO(17, 17, 17, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: termsController,
                        maxLength: 1000,
                        maxLines: 6,
                        decoration: InputDecoration(
                          hintText:
                              'Enter the terms and necessary information of the xwager',
                          contentPadding: const EdgeInsets.all(13),
                          hintStyle: const TextStyle(
                            color: Color.fromRGBO(128, 128, 131, 1),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(0, 0, 0, 0.3), width: 1),
                          ),
                          // label: Text(
                          //   'Email Address',
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .bodyMedium!
                          //       .copyWith(
                          //           color:
                          //               Theme.of(context).colorScheme.onPrimary,
                          //           fontSize: 16),
                          // ),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length <= 1) {
                            return 'Please enter terms for the wager';
                          }
                          if (value.trim().length > 50) {
                            return 'Must be at most 1000 characters';
                          }
                          return null;
                        },
                        // onSaved: (value) {
                        //   _enteredEmail = value!;
                        // },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Stake',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: const Color.fromRGBO(17, 17, 17, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: titleController,
                            decoration: InputDecoration(
                              prefixIcon: SizedBox(
                                width: 10,
                                height: 10,
                                // decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(10),
                                //     color: const Color.fromRGBO(4, 193, 0, 1)),
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color:
                                            const Color.fromRGBO(4, 193, 0, 1)),
                                    child: Text(
                                      '\$',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                              hintText: '0.00',
                              contentPadding: const EdgeInsets.all(13),
                              hintStyle: const TextStyle(
                                color: Color.fromRGBO(128, 128, 131, 1),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.3),
                                    width: 1),
                              ),
                              // label: Text(
                              //   'Email Address',
                              //   style: Theme.of(context)
                              //       .textTheme
                              //       .bodyMedium!
                              //       .copyWith(
                              //           color:
                              //               Theme.of(context).colorScheme.onPrimary,
                              //           fontSize: 16),
                              // ),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.trim().length <= 1) {
                                return 'Please enter wager title';
                              }
                              if (value.trim().length > 50) {
                                return 'Must be at most 50 characters';
                              }
                              return null;
                            },
                            // onSaved: (value) {
                            //   _enteredEmail = value!;
                            // },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'You have 0.00 USDT',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    shadowColor: Theme.of(context).colorScheme.onPrimary,
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(double.infinity, 36),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Confirm',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
