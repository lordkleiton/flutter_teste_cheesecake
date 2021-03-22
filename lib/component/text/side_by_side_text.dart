import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'overflow_text.dart';

class SideBySideTextComponent extends StatelessWidget {
  final String first;
  final String second;

  SideBySideTextComponent({required this.first, required this.second});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: OverflowableTextComponent(
          text: first,
          customStyle: Theme.of(context).textTheme.caption,
        )),
        Text(
          second,
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}
