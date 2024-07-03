import "package:flutter/material.dart";
import "package:xwager/screens/carousel.dart";
import "package:xwager/screens/welcome/last_welcome.dart";

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    void navToLastWelcome() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => const LastWelcome(),
        ),
      );
    }

    // Get the device height
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
                  const SizedBox(
                    child: CarouselScreen(),
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
                        onPressed: navToLastWelcome,
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
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
