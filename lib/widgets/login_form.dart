import 'package:flutter/material.dart';
import 'package:xwager/screens/auth/forgot_password.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _enteredEmailController = TextEditingController();
  final _enteredPasswordController = TextEditingController();
  bool _passwordVisible = false;
  bool _isChecked = false;

  void _submitLoginForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) => const ForgotPasswordScreen(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _enteredEmailController.dispose();
    _enteredPasswordController.dispose();
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
              TextFormField(
                controller: _enteredPasswordController,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock,
                      color: Theme.of(context).colorScheme.onPrimary),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    icon: _passwordVisible
                        ? Icon(Icons.visibility_off,
                            color: Theme.of(context).colorScheme.onPrimary)
                        : Icon(Icons.visibility,
                            color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 0.3), width: 1),
                  ),
                  label: Text(
                    'Password',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 16),
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1) {
                    return 'Please enter a password';
                  }
                  if (value.trim().length > 50) {
                    return 'Password must be at most 50 characters';
                  }

                  return null;
                },

                // onSaved: (value) {
                //   _enteredPassword = value!;
                // },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.25,
                        child: Checkbox(
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.onPrimary,
                              width: 2),
                          checkColor: Colors.white,
                          activeColor: Theme.of(context).colorScheme.onPrimary,
                          visualDensity: const VisualDensity(
                              horizontal: -4.0, vertical: -4.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          value: _isChecked,
                          onChanged: (val) {
                            setState(() {
                              _isChecked = val ?? false;
                            });
                          },
                        ),
                      ),
                      Text(
                        'Remember me',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color.fromRGBO(0, 8, 20, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot password?',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color.fromRGBO(0, 8, 20, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
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
                onPressed: _submitLoginForm,
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
