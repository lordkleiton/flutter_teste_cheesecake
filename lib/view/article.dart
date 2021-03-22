import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_cheesecake/component/text/side_by_side_text.dart';
import 'package:teste_cheesecake/model/article.dart';

class ArticleView extends StatelessWidget {
  final Article article;
  final String hero;

  ArticleView({required this.article, required this.hero});

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final double _basePadding = 10.0;
    final double _verticalPadding = _basePadding * 5;
    final double _expandedHeight = _size.height * 0.4;
    final String _tags = article.tags
        .map((e) => e.label)
        .reduce((value, element) => '$value, $element');

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: _expandedHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: hero,
                child: CachedNetworkImage(
                  imageUrl: article.image_url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: _size.width,
              padding: EdgeInsets.all(_basePadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    article.website,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    article.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: _basePadding),
                    child: SideBySideTextComponent(
                      first: article.authors,
                      second: article.date,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: _basePadding,
                      right: _basePadding,
                      top: _verticalPadding,
                      bottom: _verticalPadding,
                    ),
                    child: Text(
                      article.content,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.tag),
                        Text(_tags),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
