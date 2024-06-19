import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:xwager/widgets/register_form.dart";

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Create Account'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const RegisterForm(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 70,
                  height: 2,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(223, 223, 223, 1),
                  ),
                ),
                Text(
                  'or continue with',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: 70,
                  height: 2,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(223, 223, 223, 1),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 19),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(
                        color: Color.fromRGBO(223, 223, 223, 1), width: 2),
                  ),
                  onPressed: () {},
                  child: Image.asset('assets/images/apple.png'),
                ),
                const SizedBox(
                  width: 20,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 19),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(
                        color: Color.fromRGBO(223, 223, 223, 1), width: 2),
                  ),
                  onPressed: () {},
                  child: Image.asset('assets/images/google.png'),
                ),
                const SizedBox(
                  width: 20,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 19),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(
                        color: Color.fromRGBO(223, 223, 223, 1), width: 2),
                  ),
                  onPressed: () {},
                  child: Image.asset('assets/images/facebook.png'),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color.fromRGBO(134, 134, 134, 0.7),
                      fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign In',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w500),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Define the action for the button
                          // print('Hello');
                        },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
