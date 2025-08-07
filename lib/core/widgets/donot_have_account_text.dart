import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HaveAccountOrNotText extends StatelessWidget {
  const HaveAccountOrNotText({
    super.key,
    this.onPressed,
    required this.description,
    required this.buttonText,
  });
  final void Function()? onPressed;
  final String description, buttonText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(description, style: Theme.of(context).textTheme.titleLarge),
        CupertinoButton(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          minimumSize: const Size(0, 0),
          child: Text(
            buttonText,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
