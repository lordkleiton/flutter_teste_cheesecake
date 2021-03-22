import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_cheesecake/component/text/overflow_text.dart';
import 'package:teste_cheesecake/component/text/side_by_side_text.dart';
import 'package:teste_cheesecake/consts.dart';
import 'package:teste_cheesecake/model/custom_article.dart';
import 'package:teste_cheesecake/routes.dart';
import 'package:teste_cheesecake/state/app_state.dart';

class SelectableArticleComponent extends StatelessWidget {
  final int index;
  final CustomArticle article;

  SelectableArticleComponent({required this.index, required this.article});

  @override
  Widget build(BuildContext context) {
    const double _max_size = 100.0;
    final AppState appState = Provider.of(context);
    final Size _size = MediaQuery.of(context).size;
    final double _proportion = _size.width * 0.2;
    final double _boxSize = _proportion > _max_size ? _max_size : _proportion;
    final double _padding = _boxSize * 0.2;
    final double _radius = _boxSize * 0.1;
    final double _height = _boxSize + _padding;
    final String _hero = 'hero-${article.article.image_url}';

    return InkWell(
      child: Container(
        height: _height,
        padding: EdgeInsets.all(_padding),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(_radius),
              ),
              child: Container(
                width: _boxSize,
                height: _boxSize,
                child: Hero(
                  tag: _hero,
                  child: CachedNetworkImage(
                    imageUrl: article.article.image_url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: _padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OverflowableTextComponent(
                      text: article.article.title,
                      maxLines: 2,
                      bold: !article.read,
                    ),
                    Spacer(),
                    SideBySideTextComponent(
                      first: article.article.authors,
                      second: article.article.date,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        appState.setRead(index);

        Navigator.of(context).pushNamed(AppRoutes.article, arguments: {
          AppConsts.articleArg: article.article,
          AppConsts.articleHero: _hero
        });
      },
    );
  }
}
