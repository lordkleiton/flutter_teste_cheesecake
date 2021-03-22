import 'package:flutter/material.dart';

class OnErrorComponent extends StatelessWidget {
  final Function retry;

  OnErrorComponent({required this.retry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('An error has occurred'),
          MaterialButton(
            child: Text('Try again'),
            onPressed: () => retry(),
          ),
        ],
      ),
    );
  }
}
