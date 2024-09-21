import 'package:flutter/material.dart';
import 'package:xwager/screens/FPL/welcome_to_fpl_step1.dart';

class WelcomeToFPL extends StatelessWidget {
  const WelcomeToFPL({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to FPL Contest'),
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        leading: IconButton(
          style: IconButton.styleFrom(
            foregroundColor: const Color.fromRGBO(39, 67, 253, 1),
            backgroundColor: const Color.fromRGBO(245, 244, 248, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/premier-league-logo.png',
              height: 350,
              width: 350,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Connect your FPL account and create weekly or season based contests or competitions with managers in your league ',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Read more about it here',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => const WelcomeToFPLContestStep1(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Continue',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(
                      Icons.arrow_right_alt,
                      color: Colors.white,
                      size: 32,
                    )
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
