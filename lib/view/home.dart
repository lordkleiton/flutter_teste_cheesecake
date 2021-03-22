import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:teste_cheesecake/component/article/selectable_article.dart';
import 'package:teste_cheesecake/model/custom_article.dart';
import 'package:teste_cheesecake/state/app_state.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final AppState appState = Provider.of(context);
    final bool loading = appState.loading;
    final bool error = appState.error;
    final List<CustomArticle> articles = appState.articles;
    final Widget onLoading = Center(
      child: CircularProgressIndicator(),
    );
    final Widget onError = Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('ocorreu um erro ao buscar os artigos'),
          MaterialButton(
            child: Text('dnv'),
            onPressed: () {
              appState.loadArticles();
            },
          ),
        ],
      ),
    );
    final Widget onData = ListView.separated(
      separatorBuilder: (contex, index) => Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: Divider(
          height: 1,
        ),
      ),
      itemCount: articles.length,
      itemBuilder: (context, index) => SelectableArticleComponent(
        article: articles[index].article,
      ),
    );

    final Widget child = loading
        ? onLoading
        : error
            ? onError
            : onData;

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
                  return AlertDialog(
                    title: Text('Sort by:'),
                    content: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RadioListTile(
                            title: Text('Date'),
                            value: 0,
                            groupValue: 1,
                            onChanged: (value) {
                              print(value);
                            },
                          ),
                          RadioListTile(
                            title: Text('Title'),
                            value: 1,
                            groupValue: 1,
                            onChanged: (value) {
                              print(value);
                            },
                          ),
                          RadioListTile(
                            title: Text('Author'),
                            value: 2,
                            groupValue: 1,
                            onChanged: (value) {
                              print(value);
                            },
                          )
                        ],
                      ),
                    ),
                  );
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
