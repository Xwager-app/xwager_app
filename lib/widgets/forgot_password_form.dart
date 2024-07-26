import 'package:flutter/material.dart';
import 'package:xwager/screens/auth/password_reset.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() {
    return _ForgotPasswordFormState();
  }
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  final _enteredEmailController = TextEditingController();

  void _submitForgotPasswordForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) => const PasswordReset(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _enteredEmailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _enteredEmailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email,
                      color: Theme.of(context).colorScheme.onPrimary),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 0.3), width: 1),
                  ),
                  label: Text(
                    'Email Address',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 16),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1) {
                    return 'Please enter a valid email address';
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  shadowColor: Theme.of(context).colorScheme.onPrimary,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(double.infinity, 36),
                ),
                onPressed: _submitForgotPasswordForm,
                child: Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          )),
    );
  }
}
