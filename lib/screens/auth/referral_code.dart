import 'package:flutter/material.dart';
import 'package:xwager/screens/auth/proceed.dart';

class ReferralCode extends StatefulWidget {
  const ReferralCode({super.key});

  @override
  State<ReferralCode> createState() {
    return _ReferralCodeState();
  }
}

class _ReferralCodeState extends State<ReferralCode> {
  final _referralCodeController = TextEditingController();
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    double safeAreaTopPadding = MediaQuery.of(context).padding.top;

    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromRGBO(0, 8, 20, 1),
        leading: const SizedBox(
          width: 0,
        ),
        title: Text(
          'Enter Referral Code',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w600, fontSize: 24),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: deviceHeight - safeAreaTopPadding),
            child: Container(
              padding: EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: keyboardSpace + 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Who referred you or what community are you from?',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color.fromRGBO(17, 17, 17, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _referralCodeController,
                        onChanged: (value) {
                          if (_referralCodeController.text.isNotEmpty) {
                            setState(() {
                              _errorText = null;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          errorText: _errorText,
                          errorStyle: const TextStyle(color: Colors.red),
                          hintText: 'Enter code',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color: const Color.fromRGBO(134, 134, 134, 1),
                              ),
                          suffix: const Text('Optional'),
                          filled: true,
                          fillColor: const Color.fromRGBO(229, 235, 240, 1),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(229, 235, 240, 1)),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 0),
                            side: BorderSide(
                                color: Theme.of(context).colorScheme.onPrimary,
                                width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            minimumSize: const Size(double.infinity, 36),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => const ProceedScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Skip',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 0),
                            backgroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            minimumSize: const Size(double.infinity, 36),
                          ),
                          onPressed: () {
                            if (_referralCodeController.text.isEmpty) {
                              setState(() {
                                _errorText = 'Please enter a code';
                              });
                            }
                          },
                          child: Text(
                            'Proceed',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
