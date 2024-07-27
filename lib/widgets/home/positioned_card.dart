import 'package:flutter/material.dart';

class PositionedCard extends StatelessWidget {
  const PositionedCard(
      {super.key,
      this.innerItem,
      this.containerColor,
      this.containerPadding,
      required this.bottom,
      required this.left,
      required this.right});

  final Widget? innerItem;
  final Color? containerColor;
  final EdgeInsetsGeometry? containerPadding;
  final double bottom;
  final double left;
  final double right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      left: left,
      right: right,
      child: Center(
        child: Container(
          width: double.infinity,
          height: 190,
          padding: containerPadding,
          decoration: BoxDecoration(
            color: containerColor ?? Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
              ),
              BoxShadow(
                color: Colors.white,
                blurRadius: 10,
              )
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: innerItem,
        ),
      ),
    );
  }
}
