import 'package:flutter/material.dart';
import 'package:teste_cheesecake/component/article/selectable_article.dart';
import 'package:teste_cheesecake/model/custom_article.dart';

class OnDataComponent extends StatelessWidget {
  final List<CustomArticle> articles;

  OnDataComponent({required this.articles});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ListView.separated(
      separatorBuilder: (contex, index) => Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: Divider(
          height: 1,
        ),
      ),
      itemCount: articles.length,
      itemBuilder: (context, index) => SelectableArticleComponent(
        article: articles[index],
        index: index,
      ),
    );
  }
}
