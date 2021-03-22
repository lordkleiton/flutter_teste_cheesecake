import 'package:flutter/widgets.dart';
import 'package:teste_cheesecake/model/article.dart';
import 'package:teste_cheesecake/model/custom_article.dart';
import 'package:teste_cheesecake/network/rest.dart';
import 'package:teste_cheesecake/utils.dart';

class AppState with ChangeNotifier {
  bool _loading = true;
  bool get loading => _loading;

  bool _error = false;
  bool get error => _error;

  bool _init = false;

  int _sortOrder = 0;
  int get sortOrder => _sortOrder;
  set sortOrder(int value) {
    _sortOrder = value;

    _articles = AppUtils.sortArticles(_articles, _sortOrder);

    notifyListeners();
  }

  List<CustomArticle> _articles = [];
  List<CustomArticle> get articles =>
      AppUtils.sortArticles(_articles, _sortOrder);

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

      loadArticles(notify: false);
    }
  }

  void loadArticles({bool notify = true}) {
    _error = false;
    _loading = true;

    if (notify) notifyListeners();

    RestManager.get().then((list) {
      final List<Article> articlesList =
          list.map((json) => Article.fromJson(json)).toList();
      final List<CustomArticle> customArticles =
          articlesList.map((a) => CustomArticle(article: a)).toList();

      _articles = AppUtils.sortArticles(customArticles, _sortOrder);

      _loading = false;
      _error = false;

      notifyListeners();
    }).catchError((e, s) {
      print(e);
      print(s);

      _articles = [];

      _loading = false;
      _error = true;

      notifyListeners();
    });
  }
}
