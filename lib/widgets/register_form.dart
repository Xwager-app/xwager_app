import "package:flutter/material.dart";
import "package:xwager/data/password_validators.dart";
import "package:xwager/widgets/password_validator.dart";

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _enteredEmailController = TextEditingController();
  final _enteredNameController = TextEditingController();
  final _enteredPasswordController = TextEditingController();
  final _enteredPasswordConfirmController = TextEditingController();
  bool _passwordsMatched = true;
  bool _passwordVisible = false;
  bool _passwordConfirmVisible = false;
  bool _passwordIsChanging = false;

  // password validators
  bool _passwordMinimum = false;
  bool _passwordContainsUppercase = false;
  bool _passwordContainsLowercase = false;
  bool _passwordContainsNumber = false;
  bool _passwordContainsSpecialCharacters = false;

  void _submitCreateAccForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    print(_enteredNameController.text);
    print(_enteredEmailController.text);
    print(_enteredPasswordController.text);
    print(_enteredPasswordConfirmController.text);
  }

  void _checkPasswordMatch() {
    setState(() {
      _passwordsMatched = _enteredPasswordConfirmController.text ==
          _enteredPasswordController.text;
    });
  }

  void _checkPasswordMinimum() {
    setState(() {
      _passwordMinimum = _enteredPasswordController.text.length >= 8;
    });
  }

  void _checkPasswordContainsUppercase() {
    setState(() {
      _passwordContainsUppercase =
          RegExp(r'[A-Z]').hasMatch(_enteredPasswordController.text);
    });
  }

  void _checkPasswordContainsLowercase() {
    setState(() {
      _passwordContainsLowercase =
          RegExp(r'[a-z]').hasMatch(_enteredPasswordController.text);
    });
  }

  void _checkPasswordContainsNumber() {
    setState(() {
      _passwordContainsNumber =
          RegExp(r'[0-9]').hasMatch(_enteredPasswordController.text);
    });
  }

  void _checkPasswordContainsSpecialCharacters() {
    setState(() {
      _passwordContainsSpecialCharacters = RegExp(r'[!@#$%^&*(),.?":{}|<>]')
          .hasMatch(_enteredPasswordController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _enteredPasswordController.dispose();
    _enteredPasswordConfirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<bool> passwordValidatorsList = [
      _passwordMinimum,
      _passwordContainsUppercase,
      _passwordContainsLowercase,
      _passwordContainsNumber,
      _passwordContainsSpecialCharacters
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _enteredNameController,
              // maxLength: 50,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 0.3), width: 1),
                ),
                label: Text(
                  'Full Name',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 16),
                ),
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length <= 1) {
                  print(value);

                  return 'Please enter a name';
                }
                if (value.trim().length > 50) {
                  return 'Name must be at most 50 characters';
                }
                return null;
              },
              // onChanged: (value) {
              //   print(value);
              // },
              // onSaved: (value) {
              //   setState(() {
              //     _enteredName = value!;
              //   });
              // },
            ),
            const SizedBox(
              height: 20,
            ),
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
              onChanged: (value) {
                setState(() {
                  _passwordIsChanging = true;
                });
                _checkPasswordMinimum();
                _checkPasswordContainsUppercase();
                _checkPasswordContainsLowercase();
                _checkPasswordContainsNumber();
                _checkPasswordContainsSpecialCharacters();
              },
              // onSaved: (value) {
              //   _enteredPassword = value!;
              // },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _enteredPasswordConfirmController,
              obscureText: !_passwordConfirmVisible,
              decoration: InputDecoration(
                errorText: !_passwordsMatched &&
                        _enteredPasswordConfirmController.text.isNotEmpty
                    ? 'Passwords do not match'
                    : null,
                prefixIcon: Icon(Icons.lock,
                    color: Theme.of(context).colorScheme.onPrimary),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _passwordConfirmVisible = !_passwordConfirmVisible;
                    });
                  },
                  icon: _passwordConfirmVisible
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
                  'Re-enter Password',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 16),
                ),
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length <= 1) {
                  return 'Password confirm is required';
                }
                if (value != _enteredPasswordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              // onSaved: (value) {
              //   _enteredPasswordConfirm = value!;
              // },
              onChanged: (value) {
                _checkPasswordMatch();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                // for( final validator in passwordValidators)
                ...passwordValidators.asMap().entries.map((entry) =>
                    PasswordValidators(
                        validator: entry.value,
                        isPasswordChanged: _passwordIsChanging,
                        isValid: passwordValidatorsList[entry.key]))
              ],
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
              onPressed: _submitCreateAccForm,
              child: Text(
                'Sign up',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
