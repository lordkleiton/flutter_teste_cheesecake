import 'package:teste_cheesecake/enums.dart';

class SortOption {
  final String title;
  final int value;
  final SortEnums sortEnum;

  SortOption({required this.title, this.value = 0, required this.sortEnum});
}
