import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_cheesecake/enums.dart';
import 'package:teste_cheesecake/model/article.dart';
import 'package:teste_cheesecake/routes.dart';
import 'package:teste_cheesecake/view/article.dart';
import 'package:teste_cheesecake/view/home.dart';

abstract class AppRouter {
  static Route<dynamic> routeGenerator(RouteSettings settings) {
    final Map<String, dynamic>? args =
        settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case AppRoutes.home:
        return _builder(HomeView());
      case AppRoutes.article:
        return _builder(ArticleView(
          article: args?[Enums.articleArg] as Article,
          hero: args?[Enums.articleHero] as String,
        ));
      default:
        return _builder(_err());
    }
  }

  static Widget _err() => Scaffold(
        appBar: AppBar(
          title: Text('erro'),
        ),
        body: Center(
          child: Text('você não devia ter chegado aqui'),
        ),
      );

  static MaterialPageRoute _builder(Widget widget) =>
      MaterialPageRoute(builder: (context) => widget);
}
