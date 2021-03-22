import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_cheesecake/component/text/overflow_text.dart';
import 'package:teste_cheesecake/model/article.dart';

class SelectableArticleComponent extends StatelessWidget {
  final Article article;
  final bool read;

  SelectableArticleComponent(
      {Key? key, required this.article, this.read = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _max_size = 100.0;
    final Size _size = MediaQuery.of(context).size;
    final double _proportion = _size.width * 0.2;
    final double _boxSize = _proportion > _max_size ? _max_size : _proportion;
    final double _radius = _boxSize * 0.1;
    final double _height = _boxSize + _radius;

    return InkWell(
      child: Container(
        height: _height,
        padding: EdgeInsets.all(_radius),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(_radius),
              ),
              child: Container(
                width: _boxSize,
                height: _boxSize,
                child: Hero(
                  tag: 'hero-${article.image_url}',
                  child: CachedNetworkImage(
                    imageUrl: article.image_url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: _radius),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OverflowableTextComponent(
                      text: article.title,
                      maxLines: 2,
                      bold: read,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: OverflowableTextComponent(
                            text: article.authors,
                          ),
                        ),
                        Text(article.date),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
