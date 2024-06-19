import "package:flutter/material.dart";
import "package:xwager/data/welcome_messages.dart";
import "package:xwager/screens/welcome/last_welcome.dart";

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() {
    return _Welcome();
  }
}

class _Welcome extends State<Welcome> {
  var currentPageIndex = 0;

  void _navToNextPage() {
    if (currentPageIndex == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => const LastWelcome(),
        ),
      );
      return;
    }
    setState(() {
      currentPageIndex += 1;
    });
  }

  void _navToLastWelcome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) => const LastWelcome(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the device width
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(minHeight: deviceHeight),
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
        padding: const EdgeInsets.fromLTRB(0, 48, 0, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 60, 15, 0),
                      child: Image.asset(
                        'assets/images/arrow_11.png',
                      ),
                    ),
                    Image.asset(
                      'assets/images/logo-2.png',
                      width: 200,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: deviceWidth *
                        0.7, // Set width to 50% of the device width
                    child: Column(
                      children: [
                        Text(
                          messages[currentPageIndex].title,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 32, color: Colors.white),
                        ),
                        Text(messages[currentPageIndex].text,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white, fontSize: 16)),
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          children: [
                            for (final (i, _) in messages.indexed)
                              Container(
                                width: i == currentPageIndex ? 20 : 15,
                                height: i == currentPageIndex ? 20 : 15,
                                margin: const EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                    color: i == currentPageIndex
                                        ? Colors.white
                                        : Colors.transparent,
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(50)),
                              )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 35),
                          side: const BorderSide(color: Colors.white, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: _navToLastWelcome,
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: _navToNextPage,
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        icon: const Icon(
                          Icons.arrow_right_alt_outlined,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
