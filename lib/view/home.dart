import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Center(
          child: Text('oie'),
        ),
      ),
    );
  }
}
