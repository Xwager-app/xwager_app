import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:xwager/screens/auth/register.dart";

class LastWelcome extends StatelessWidget {
  const LastWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(minHeight: deviceHeight),
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.fromLTRB(0, 48, 0, 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.asset(
                      'assets/images/arrow_12.png',
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Image.asset(
                        'assets/images/logo-3.png',
                        width: 200,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Create a xwager account and create your terms',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 25,
                        ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Invite your friends & get the game on',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 25,
                        ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 0),
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(double.infinity, 36),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const Register(),
                        ),
                      );
                    },
                    child: Text(
                      'Create an account',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 0),
                      backgroundColor: Colors.white,
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.onPrimary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(double.infinity, 36),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text:
                      'By creating an account, and using this app, you agree to Xwager’s ',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color.fromRGBO(134, 134, 134, 0.7),
                      fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Privacy policy',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w500),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Define the action for the button
                        },
                    ),
                    const TextSpan(text: ' and'),
                    TextSpan(
                      text: ' Terms',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w500),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Define the action for the button
                        },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
