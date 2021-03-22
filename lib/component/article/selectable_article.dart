import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    const double max_size = 100.0;
    final AppState appState = Provider.of(context);
    final Size size = MediaQuery.of(context).size;
    final double proportion = size.width * 0.2;
    final double boxSize = proportion > max_size ? max_size : proportion;
    final double padding = boxSize * 0.2;
    final double radius = boxSize * 0.1;
    final double height = boxSize + padding;
    final String hero = 'hero-${article.article.image_url}';
    final bool read = article.read;
    final Widget slideAction = SlideAction(
      color: read ? Colors.blue : Colors.green,
      onTap: () {
        appState.toggleRead(index);
      },
      child: Text(
        read ? 'Mark as unread' : 'Mark as read',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actions: [
        slideAction,
      ],
      secondaryActions: [
        slideAction,
      ],
      child: InkWell(
        child: Container(
          height: height,
          padding: EdgeInsets.all(padding),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius),
                ),
                child: Container(
                  width: boxSize,
                  height: boxSize,
                  child: Hero(
                    tag: hero,
                    child: CachedNetworkImage(
                      imageUrl: article.article.image_url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OverflowableTextComponent(
                        text: article.article.title,
                        maxLines: 2,
                        bold: !read,
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
            AppConsts.articleHero: hero
          });
        },
      ),
    );
  }
}
