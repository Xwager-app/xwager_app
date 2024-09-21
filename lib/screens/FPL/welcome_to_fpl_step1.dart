import 'package:flutter/material.dart';
import 'package:xwager/screens/FPL/connect_account_modal.dart';

class WelcomeToFPLContestStep1 extends StatefulWidget {
  const WelcomeToFPLContestStep1({super.key});

  @override
  State<WelcomeToFPLContestStep1> createState() {
    return _WelcomeToFPLContestStep1State();
  }
}

class _WelcomeToFPLContestStep1State extends State<WelcomeToFPLContestStep1> {
  final _formKey = GlobalKey<FormState>();

  final _enteredManagerIDController = TextEditingController();

  void _submitForgotPasswordForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => const ConnectAccountModal(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _enteredManagerIDController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FPL Contest'),
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        actions: [
          Text(
            'Step',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onPrimary),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...[1, 2, 3].map(
                (step) => Container(
                  width: step == 1 ? 15 : 10,
                  height: step == 1 ? 15 : 10,
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: step == 1
                        ? Colors.white
                        : Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        width: 3,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          )
        ],
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
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Please kindly enter your Manager ID ',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                        controller: _enteredManagerIDController,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(0, 0, 0, 0.3), width: 1),
                          ),
                          label: Text(
                            'Enter Your Manager ID',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontSize: 16),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length <= 1) {
                            return 'Please enter a valid manager id';
                          }
                          if (value.trim().length > 50) {
                            return 'Must be at most 50 characters';
                          }
                          return null;
                        },
                        // onSaved: (value) {
                        //   _enteredEmail = value!;
                        // },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: _submitForgotPasswordForm,
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
