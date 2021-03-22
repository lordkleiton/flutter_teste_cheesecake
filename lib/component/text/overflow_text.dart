import 'package:flutter/material.dart';

class OverflowableTextComponent extends StatelessWidget {
  final String text;
  final bool bold;
  final int maxLines;
  final bool subtitle;

  OverflowableTextComponent(
      {required this.text,
      this.bold = false,
      this.maxLines = 1,
      this.subtitle = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: bold
          ? TextStyle(
              fontWeight: FontWeight.bold,
            )
          : null,
    );
  }
}
