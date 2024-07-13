import 'package:xwager/models/password_validator.dart';

final passwordValidators = [
  PasswordValidator('Minimum of 8 characters long.'),
  PasswordValidator('Uppercase letters (A-Z)'),
  PasswordValidator('Lowercase letters (a-z)'),
  PasswordValidator('Numbers (0-9)'),
  PasswordValidator('Special characters (e.g., !, @, #, \$, %, etc.)')
];
