import 'package:flutter/material.dart';
import 'package:xwager/models/password_validator.dart';

class PasswordValidators extends StatelessWidget {
  const PasswordValidators(
      {super.key,
      required this.validator,
      required this.isValid,
      required this.isPasswordChanged});

  final PasswordValidator validator;
  final bool isValid;
  final bool isPasswordChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            validator.icon,
            color: isPasswordChanged && !isValid
                ? Colors.red
                : isPasswordChanged && isValid
                    ? Colors.green
                    : const Color.fromRGBO(
                        17,
                        17,
                        17,
                        1,
                      ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              validator.text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isPasswordChanged && !isValid
                        ? Colors.red
                        : isPasswordChanged && isValid
                            ? Colors.green
                            : const Color.fromRGBO(
                                17,
                                17,
                                17,
                                1,
                              ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
