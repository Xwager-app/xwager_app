import 'package:flutter/material.dart';
import 'package:xwager/models/debouncer.dart';
import 'package:circular_gradient_spinner/circular_gradient_spinner.dart';
import 'package:xwager/screens/auth/create_unique_pin.dart';

enum CheckTagState { notLoading, loading, taken, free }

class CreateXwagerTagScreen extends StatefulWidget {
  const CreateXwagerTagScreen({super.key});

  @override
  State<CreateXwagerTagScreen> createState() {
    return _CreateXwagerTagState();
  }
}

class _CreateXwagerTagState extends State<CreateXwagerTagScreen> {
  final _tagInputController = TextEditingController();
  String? _errorText;
  // Using the manual implementation
  final debouncer = Debouncer(const Duration(milliseconds: 1000));
  CheckTagState _tagState = CheckTagState.notLoading;
  bool _userIdIsAvailable = false;

  @override
  void dispose() {
    super.dispose();
    _tagInputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget? endIcon = _tagState == CheckTagState.notLoading
        ? null
        : _tagState == CheckTagState.taken
            ? const Icon(
                Icons.error,
                color: Colors.red,
              )
            : _tagState == CheckTagState.loading
                ? const SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularGradientSpinner(
                      color: Colors.blue,
                      size: 20,
                      strokeWidth: 2,
                    ),
                  )
                : const Icon(Icons.check_circle, color: Colors.green);

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
          'Your XwagerTag',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w600, fontSize: 24),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Create Your unique tag other users can use to invite you to xwagers ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Your user ID serves as your unique identifier for P2P money transfers.',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color.fromRGBO(128, 128, 131, 1),
                        ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User Xwagertag',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: const Color.fromRGBO(17, 17, 17, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: _tagInputController,
                          onChanged: (value) {
                            setState(() {
                              _tagState = CheckTagState.loading;
                            });
                            if (_tagInputController.text.isNotEmpty) {
                              setState(() {
                                _errorText = null;
                              });
                              debouncer.run(() {
                                if (_tagInputController.text == 'Ejim121') {
                                  setState(() {
                                    _tagState = CheckTagState.free;
                                    _errorText = null;
                                    _userIdIsAvailable = true;
                                  });
                                } else {
                                  setState(() {
                                    _tagState = CheckTagState.taken;
                                    _errorText = 'User ID already taken';
                                    _userIdIsAvailable = false;
                                  });
                                }
                              });
                            } else {
                              setState(() {
                                _tagState = CheckTagState.notLoading;
                                _errorText = null;
                                _userIdIsAvailable = false;
                              });
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            errorText: _errorText,
                            prefixIcon: Icon(Icons.alternate_email,
                                color: _errorText == null
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Colors.red),
                            suffixIcon: endIcon,
                            errorStyle: const TextStyle(color: Colors.red),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  width: 1),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  width: 10),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            _userIdIsAvailable ? 'User ID is available' : '',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
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
                  if (_tagInputController.text.isEmpty) {
                    setState(() {
                      _errorText = 'Please enter a tag name';
                    });
                    return;
                  }
                  if (_tagState == CheckTagState.free) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const CreateUniquePinScreen(),
                      ),
                    );
                  }
                },
                child: Text(
                  'Next',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ]),
      ),
    );
  }
}
