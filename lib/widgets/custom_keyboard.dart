import 'package:flutter/material.dart';

class CustomKeyboard extends StatefulWidget {
  const CustomKeyboard({super.key, required this.onNumberPressed});

  final Function(String) onNumberPressed;

  @override
  State<StatefulWidget> createState() {
    return _CustomKeyboardState();
  }
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  List<Widget> _buildNumberButtons() {
    List<Widget> buttons = [];
    for (var i = 1; i <= 9; i++) {
      buttons.add(_buildNumberButton(i.toString()));
    }
    buttons.add(
      const SizedBox(
        width: 70,
        height: 40,
      ),
    );
    buttons.add(_buildNumberButton('0'));
    buttons.add(_buildDeleteButton());
    return buttons;
  }

  Widget _buildNumberButton(String number) {
    return OutlinedButton(
      onPressed: () => widget.onNumberPressed(number),
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10),
          fixedSize: const Size.square(70),
          side: BorderSide(color: Theme.of(context).colorScheme.onPrimary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          )),
      child: Text(
        number,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return OutlinedButton(
      onPressed: () => widget.onNumberPressed('delete'),
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10),
          fixedSize: const Size.square(70),
          side: BorderSide(color: Theme.of(context).colorScheme.onPrimary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          )), //delete functionality
      child: Icon(
        Icons.backspace,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> firstRow = _buildNumberButtons().sublist(0, 3);
    List<Widget> secondRow = _buildNumberButtons().sublist(3, 6);
    List<Widget> thirdRow = _buildNumberButtons().sublist(6, 9);
    List<Widget> fourthRow = _buildNumberButtons().sublist(9, 12);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: firstRow),
          const SizedBox(
            height: 15,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: secondRow),
          const SizedBox(
            height: 15,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: thirdRow),
          const SizedBox(
            height: 15,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: fourthRow),
        ],
      ),
    );
  }
}
