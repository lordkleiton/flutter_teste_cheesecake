import 'package:teste_cheesecake/enums.dart';
import 'package:teste_cheesecake/model/sort.dart';

abstract class AppConsts {
  static const String articleArg = 'article';
  static const String articleHero = 'hero';
  static final Map<int, SortOption> sortOptions = {
    0: SortOption(title: 'Date', sortEnum: SortEnums.date),
    1: SortOption(title: 'Title', sortEnum: SortEnums.title),
    2: SortOption(title: 'Author', sortEnum: SortEnums.author),
  };
}
