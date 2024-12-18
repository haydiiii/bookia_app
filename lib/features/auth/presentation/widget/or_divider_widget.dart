import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  final String text;
  const OrDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider(endIndent: 20, indent: 20)),
        Text(text),
        Expanded(child: Divider(endIndent: 20, indent: 20)),
      ],
    );
  }
}
