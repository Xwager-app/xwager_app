import 'package:flutter/material.dart';
import 'package:xwager/data/hashtags.dart';
import 'package:xwager/models/hashtag.dart';

class HashTagModal extends StatefulWidget {
  const HashTagModal({
    super.key,
    required this.onAddHashtagsHandler,
  });

  final Function(List<Hashtag> hashtags) onAddHashtagsHandler;

  @override
  State<HashTagModal> createState() => _HashTagModalState();
}

class _HashTagModalState extends State<HashTagModal> {
  final List<Hashtag> _hashtags = [];

  void _addHashtag(Hashtag hashtag) {
    if (_hashtags.contains(hashtag)) {
      setState(() {
        _hashtags.remove(hashtag);
      });
    } else {
      setState(() {
        _hashtags.add(hashtag);
      });
    }
  }

  List<List<T>> splitIntoChunks<T>(List<T> list, int chunkSize) {
    List<List<T>> chunks = [];
    for (int i = 0; i < list.length; i += chunkSize) {
      int end = (i + chunkSize < list.length) ? i + chunkSize : list.length;
      chunks.add(list.sublist(i, end));
    }
    return chunks;
  }

  void _addHastagsAndCloseModal() {
    widget.onAddHashtagsHandler(_hashtags);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding:
            const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 50),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23),
            topRight: Radius.circular(23),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.cancel_sharp,
                      size: 32,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Add Hashtag(s)',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: const Color.fromRGBO(17, 17, 17, 1),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Hashtags helps other users find your xwager easily and quickly ',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        ...splitIntoChunks(hashtags, 3).map(
                          (hashtagPairs) => Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color.fromRGBO(
                                      0, 0, 0, 1), // Border color
                                  width: 1, // Border width
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ...hashtagPairs.map(
                                  (hashtag) => SizedBox(
                                    // fit: FlexFit.tight,
                                    width: 110,
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        visualDensity: VisualDensity.compact,
                                        padding: const EdgeInsets.all(5),
                                        elevation:
                                            _hashtags.contains(hashtag) ? 2 : 0,
                                        shadowColor: _hashtags.contains(hashtag)
                                            ? Theme.of(context)
                                                .colorScheme
                                                .onPrimary
                                            : Colors.white,
                                        backgroundColor:
                                            _hashtags.contains(hashtag)
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary
                                                : Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        side: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary),
                                      ),
                                      onPressed: () {
                                        _addHashtag(hashtag);
                                      },
                                      child: Text(
                                        hashtag.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                color:
                                                    _hashtags.contains(hashtag)
                                                        ? Colors.white
                                                        : Theme.of(context)
                                                            .colorScheme
                                                            .onPrimary,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shadowColor: Theme.of(context).colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 0),
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(double.infinity, 36),
                    ),
                    onPressed: _addHastagsAndCloseModal,
                    child: Text(
                      'Done',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
