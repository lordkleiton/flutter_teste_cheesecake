import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_cheesecake/model/article.dart';

class SelectableArticleComponent extends StatelessWidget {
  final Article article;

  SelectableArticleComponent({Key? key, required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final double _boxSize = _size.width;

    return InkWell(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              width: 50.0,
              height: 50.0,
              child: CachedNetworkImage(
                imageUrl: article.image_url,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              article.title,
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
