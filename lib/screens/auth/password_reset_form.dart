import 'package:flutter/material.dart';
import 'package:xwager/screens/auth/login.dart';
import 'package:xwager/widgets/create_new_password_form.dart';

class PasswordResetForm extends StatefulWidget {
  const PasswordResetForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PasswordResetFormState();
  }
}

class _PasswordResetFormState extends State<PasswordResetForm> {
  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    double deviceHeight = MediaQuery.of(context).size.height;

    double safeAreaTopPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Password Reset'),
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
                builder: (ctx) => const Login(),
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
              padding: EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: keyboardSpace + 50),
              child: Column(
                children: [
                  Text(
                    'Please kindly input a new password',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: const Color.fromRGBO(17, 17, 17, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const CreateNewPasswordForm()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
