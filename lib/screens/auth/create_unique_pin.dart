import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:xwager/screens/auth/referral_code.dart';
import 'package:xwager/widgets/custom_keyboard.dart';

class CreateUniquePinScreen extends StatefulWidget {
  const CreateUniquePinScreen({super.key});

  @override
  State<CreateUniquePinScreen> createState() {
    return _CreateUniquePinScreenState();
  }
}

class _CreateUniquePinScreenState extends State<CreateUniquePinScreen> {
  final pinController = TextEditingController();
  String number = '';
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

  void _showModal() {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        // backgroundColor: Colors.white,
        child: Container(
          width: 300,
          // height: 200,
          padding:
              const EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/good.png'),
              const SizedBox(height: 43),
              Text(
                'Congratulations!',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 35),
              Text(
                'Your new PIN has been successfully set.',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black, fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const ReferralCode(),
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
            ],
          ),
        ),
      ),
    );
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
        foregroundColor: const Color.fromRGBO(0, 8, 20, 1),
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
        title: Text(
          'Create Unique PIN',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w600, fontSize: 24),
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
                    Text(
                      'Please kindly create a pin for claiming prize access authorization.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color.fromRGBO(17, 17, 17, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
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
                    const SizedBox(
                      height: 30,
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
                    _showModal();
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (ctx) => const CreateXwagerTagScreen(),
                    //   ),
                    // );
                  },
                  child: Text(
                    'Submit',
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
