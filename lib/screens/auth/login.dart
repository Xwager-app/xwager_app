import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:xwager/screens/auth/register.dart';
import 'package:xwager/screens/welcome/last_welcome.dart';
import 'package:xwager/widgets/login_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    double safeAreaTopPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Login'),
        leading: IconButton(
          style: IconButton.styleFrom(
            foregroundColor: const Color.fromRGBO(39, 67, 253, 1),
            backgroundColor: const Color.fromRGBO(245, 244, 248, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (ctx) => const LastWelcome(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: deviceHeight - safeAreaTopPadding),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Column(
                children: [
                  const LoginForm(),
                  const SizedBox(
                    height: 50,
                  ),
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
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
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
                              color: Color.fromRGBO(223, 223, 223, 1),
                              width: 2),
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
                              color: Color.fromRGBO(223, 223, 223, 1),
                              width: 2),
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
                              color: Color.fromRGBO(223, 223, 223, 1),
                              width: 2),
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color.fromRGBO(134, 134, 134, 0.7),
                            fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w500),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Define the action for the button
                                // print('Hello');
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) => const Register(),
                                  ),
                                );
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
          ),
        ),
      ),
    );
  }
}
