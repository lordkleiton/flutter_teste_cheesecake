import 'package:flutter/widgets.dart';
import 'package:teste_cheesecake/model/article.dart';
import 'package:teste_cheesecake/model/custom_article.dart';
import 'package:teste_cheesecake/network/rest.dart';

class AppState with ChangeNotifier {
  final List<CustomArticle> _articles = [];
  List<CustomArticle> get articles => _articles.toList();

  bool _loading = true;
  bool get loading => _loading;

  bool _error = false;
  bool get error => _error;

  bool _init = false;

  void _setRead(int pos, bool newRead) {
    final CustomArticle _old = _articles[pos];
    final CustomArticle _new =
        CustomArticle(article: _old.article, read: newRead);

    _articles[pos] = _new;

    notifyListeners();
  }

  void toggleRead(int pos) {
    final CustomArticle _old = _articles[pos];

    _setRead(pos, !_old.read);
  }

  void setRead(int pos) {
    final CustomArticle _old = _articles[pos];

    if (!_old.read) _setRead(pos, true);
  }

  void setup() {
    if (!_init) {
      _init = true;

      loadArticles();
    }
  }

  void loadArticles() {
    RestManager.get().then((list) {
      final List<Article> aux =
          list.map((json) => Article.fromJson(json)).toList();

      _articles.addAll(aux.map((a) => CustomArticle(article: a)));

      _loading = false;
      _error = false;

      notifyListeners();
    }).catchError((e, s) {
      print(e);
      print(s);

      _loading = false;
      _error = true;

      notifyListeners();
    });
  }
}
