import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_cheesecake/component/data/on_data.dart';
import 'package:teste_cheesecake/component/dialog/sort_dialog.dart';
import 'package:teste_cheesecake/component/error/on_error.dart';
import 'package:teste_cheesecake/component/loading/on_loading.dart';
import 'package:teste_cheesecake/model/custom_article.dart';
import 'package:teste_cheesecake/state/app_state.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppState appState = Provider.of(context);
    final bool loading = appState.loading;
    final bool error = appState.error;
    final List<CustomArticle> articles = appState.articles;
    final Widget nonLoading = error
        ? OnErrorComponent(retry: () {
            appState.loadArticles();
          })
        : OnDataComponent(articles: articles);
    final Widget child = loading ? OnLoadingComponent() : nonLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        actions: [
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SortDialogComponent();
                },
              );
            },
            tooltip: 'Sort',
          )
        ],
      ),
      body: Container(
        child: child,
      ),
    );
  }
}
