import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_cheesecake/component/text/side_by_side_text.dart';
import 'package:teste_cheesecake/model/article.dart';

class ArticleView extends StatelessWidget {
  final Article article;

  ArticleView({required this.article});

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final double _expandedHeight = _size.height * 0.4;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: _expandedHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'hero-${article.image_url}',
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
              padding: EdgeInsets.all(10),
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
                    padding: EdgeInsets.only(top: 10, bottom: 50),
                    child: SideBySideTextComponent(
                      first: article.authors,
                      second: article.date,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 2000,
                    child: Text(
                      article.content,
                      style: Theme.of(context).textTheme.subtitle1,
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
