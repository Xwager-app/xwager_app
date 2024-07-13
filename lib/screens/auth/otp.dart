import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:xwager/screens/auth/create_tag.dart';
import 'package:xwager/widgets/custom_keyboard.dart';

class OTPPinFieldScreen extends StatefulWidget {
  const OTPPinFieldScreen({super.key});

  @override
  State<OTPPinFieldScreen> createState() => _OTPPinFieldScreenState();
}

class _OTPPinFieldScreenState extends State<OTPPinFieldScreen> {
  final pinController = TextEditingController();
  String number = '';
  bool _isCounting = true;
  bool _isError = false;

  void onNumberPressed(String text) {
    if (text == 'delete') {
      if (number.isNotEmpty) {
        number = number.substring(0, number.length - 1);
        setState(() {
          pinController.text = number;
        });
      }
    } else {
      if (number.length == 4) {
        return;
      }
      number += text;

      setState(() {
        pinController.text = number;
        _isError = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    final focusedBorderColor = Theme.of(context).colorScheme.onPrimary;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      appBar: AppBar(
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
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: deviceHeight - 180),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'We need to confirm your email.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    const Text(
                      'Enter the 4-digit code we sent to',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(128, 128, 131, 1),
                      ),
                    ),
                    const Text(
                      'deluluisthesolulu@domain.com',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Pinput(
                      // onCompleted: (pin) => print(pin),
                      controller: pinController,
                      useNativeKeyboard: false,
                      forceErrorState: _isError,
                      defaultPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                      followingPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: const Color.fromRGBO(238, 238, 240, 1),
                          // border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary),
                        decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyWith(
                        textStyle: const TextStyle(color: Colors.red),
                        decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(color: Colors.red),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _isCounting ? 16 : 10,
                    ),
                    _isCounting
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Resend code in ',
                                style: TextStyle(
                                  color: Color.fromRGBO(128, 128, 131, 1),
                                ),
                              ),
                              Countdown(
                                seconds: 30,
                                build: (BuildContext context, double time) =>
                                    Text(
                                  // time.,
                                  time.floor().toString(),
                                  style: const TextStyle(
                                    color: Color.fromRGBO(128, 128, 131, 1),
                                  ),
                                ),
                                interval: const Duration(milliseconds: 1000),
                                onFinished: () {
                                  setState(() {
                                    _isCounting = false;
                                  });
                                },
                              )
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Didn\'t recieve any code?',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  fixedSize: const Size.fromHeight(40),
                                  textStyle: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Resend code',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
                                ),
                              ),
                            ],
                          ),
                    SizedBox(
                      height: _isCounting ? 30 : 10,
                    ),
                    CustomKeyboard(onNumberPressed: onNumberPressed)
                  ],
                ),
                // /
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(double.infinity, 36),
                  ),
                  onPressed: () {
                    if (number.length < 4) {
                      setState(() {
                        _isError = true;
                      });
                      return;
                    }
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const CreateXwagerTagScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Next',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                // const SizedBox(
                //   height: 40,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
