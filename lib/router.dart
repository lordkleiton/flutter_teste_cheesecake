import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_cheesecake/consts.dart';
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
          article: args?[AppConsts.articleArg] as Article,
          hero: args?[AppConsts.articleHero] as String,
        ));
      default:
        return _builder(_err());
    }
  }

  static Widget _err() => Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('🤔'),
        ),
      );

  static MaterialPageRoute _builder(Widget widget) =>
      MaterialPageRoute(builder: (context) => widget);
}
