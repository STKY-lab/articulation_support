import 'package:flutter/material.dart';

class InputTextButton extends StatelessWidget {
  final VoidCallback buttonFunction;
  final Widget buttonChild;
  const InputTextButton({
    super.key,
    required this.buttonFunction,
    required this.buttonChild,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary,
            spreadRadius: 0,
            blurRadius: 70,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => buttonFunction(),
        onLongPress: () => buttonFunction(),
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: const CircleBorder(),
          minimumSize: const Size(50, 50),
          maximumSize: const Size(100, 100),
        ),
        child: buttonChild,
      ),
    );
  }
}
