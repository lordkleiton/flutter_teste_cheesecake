import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_cheesecake/model/article.dart';
import 'package:teste_cheesecake/network/rest.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    RestManager.get().then((value) {
      final List<Article> list = value.map((e) => Article.fromJson(e)).toList();

      list.forEach((e) {
        print(e.content);
      });
    }).catchError((e, s) {
      print('deu ruim');
      print(e);
      print(s);
    });

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
