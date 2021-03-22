import 'package:intl/intl.dart';
import 'package:teste_cheesecake/consts.dart';
import 'package:teste_cheesecake/enums.dart';
import 'package:teste_cheesecake/model/custom_article.dart';
import 'package:teste_cheesecake/model/sort.dart';

abstract class AppUtils {
  static List<CustomArticle> sortArticles(
      List<CustomArticle> articles, int order) {
    final SortOption option = AppConsts.sortOptions[order]!;
    List<CustomArticle> res = articles.toList();

    switch (option.sortEnum) {
      case SortEnums.author:
        res.sort((a, b) => a.article.authors.compareTo(b.article.authors));
        break;
      case SortEnums.date:
        res.sort((a, b) {
          final DateFormat inputFormat = DateFormat('MM/dd/yyyy');
          final DateTime dateA = inputFormat.parse(a.article.date);
          final DateTime dateB = inputFormat.parse(b.article.date);

          return dateA.compareTo(dateB);
        });
        break;
      case SortEnums.title:
        res.sort((a, b) => a.article.title.compareTo(b.article.title));
        break;
    }

    return res;
  }
}
