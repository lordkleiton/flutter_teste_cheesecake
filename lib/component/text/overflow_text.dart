import 'package:flutter/material.dart';

class OverflowableTextComponent extends StatelessWidget {
  final String text;
  final bool bold;
  final int maxLines;
  final TextStyle? customStyle;

  OverflowableTextComponent(
      {required this.text,
      this.bold = false,
      this.maxLines = 1,
      this.customStyle});

  @override
  Widget build(BuildContext context) {
    final bool hasCustom = customStyle != null;
    final bool isBold = !hasCustom && bold;
    final TextStyle? noCustom = isBold
        ? TextStyle(
            fontWeight: FontWeight.bold,
          )
        : null;

    return Text(
      text,
      maxLines: maxLines,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: hasCustom ? customStyle : noCustom,
    );
  }
}
