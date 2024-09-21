import 'package:flutter/material.dart';
import 'package:xwager/models/hashtag.dart';
import 'package:xwager/models/xwager.dart';
import 'package:xwager/widgets/createNewWager/group.dart';
import 'package:xwager/widgets/createNewWager/head_2_head.dart';

class CreateNewWager extends StatefulWidget {
  const CreateNewWager({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CreateNewWagerState();
  }
}

class _CreateNewWagerState extends State<CreateNewWager> {
  final _formKey = GlobalKey<FormState>();

  final _enteredXwagerTitleController = TextEditingController();
  final _enteredXwagerTermsController = TextEditingController();
  final _enteredXwagerStakeController = TextEditingController();

  XwagerType xwagerType = XwagerType.head2Head;

  XwagerCategory? _xwagerCategory;

  List<Hashtag> _hashtagList = [];

  void _onAddHashtags(List<Hashtag> hashtags) {
    setState(() {
      _hashtagList = [...hashtags];
    });
  }

  void _onChooseCategory(XwagerCategory category) {
    setState(() {
      _xwagerCategory = category;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _enteredXwagerTermsController.dispose();
    _enteredXwagerTitleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_hashtagList.length);

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            color: Colors.white,
            width: double.infinity,
            child: Container(
              clipBehavior: Clip.antiAlias,
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                xwagerType == XwagerType.head2Head ? 0 : 10),
                            bottomLeft: Radius.circular(
                                xwagerType == XwagerType.head2Head ? 0 : 10),
                            topRight: const Radius.circular(0),
                            bottomRight: const Radius.circular(0),
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(0),
                            bottomLeft: const Radius.circular(0),
                            topRight: Radius.circular(
                                xwagerType == XwagerType.group ? 0 : 10),
                            bottomRight: Radius.circular(
                                xwagerType == XwagerType.group ? 0 : 10),
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
          xwagerType == XwagerType.head2Head
              ? Head2Head(
                  categoryItem: _xwagerCategory,
                  onChooseCategory: _onChooseCategory,
                  formKey: _formKey,
                  titleController: _enteredXwagerTitleController,
                  termsController: _enteredXwagerTermsController,
                  stakeController: _enteredXwagerStakeController,
                  onAddHashtags: _onAddHashtags)
              : const Group()
        ],
      ),
    );
  }
}
