import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_cheesecake/model/article.dart';

class SelectableArticleComponent extends StatelessWidget {
  final Article article;

  SelectableArticleComponent({Key? key, required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Text(article.title),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
