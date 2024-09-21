import 'package:flutter/material.dart';

class ConnectAccountModal extends StatefulWidget {
  const ConnectAccountModal({super.key});

  @override
  State<ConnectAccountModal> createState() => _ConnectAccountModalState();
}

class _ConnectAccountModalState extends State<ConnectAccountModal> {
  final _formKey = GlobalKey<FormState>();

  final _enteredFullnameController = TextEditingController();
  final _enteredTeamNameController = TextEditingController();

  void _submitForgotPasswordForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _enteredFullnameController.dispose();
    _enteredTeamNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const myBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color:
            Colors.grey, // You can change the color of the bottom border here
        width: 1.0, // Customize the width of the border
      ),
    );

    const myFocusedBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors
            .blue, // Customize the color of the bottom border when the field is focused
        width: 2.0, // Customize the width of the border
      ),
    );

    const myEnabledBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors
            .grey, // Customize the color of the bottom border when the field is enabled
        width: 1.0, // Customize the width of the border
      ),
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 50),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(23),
          topRight: Radius.circular(23),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.cancel_sharp,
              size: 32,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text(
                'FPL Account Fetched  Successfully ',
                softWrap: true,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormField(
                          controller: _enteredFullnameController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: myBorder,
                            enabledBorder: myEnabledBorder,
                            focusedBorder: myFocusedBorder,
                            label: Text(
                              'Fullname',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontSize: 16),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.trim().length <= 1) {
                              return 'Please enter a name';
                            }
                            if (value.trim().length > 90) {
                              return 'Must be at most 90 characters';
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
                          controller: _enteredTeamNameController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: myBorder,
                            enabledBorder: myEnabledBorder,
                            focusedBorder: myFocusedBorder,
                            label: Text(
                              'Team Name',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
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
                          height: 40,
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
                                  'Connect',
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
        ],
      ),
    );
  }
}
