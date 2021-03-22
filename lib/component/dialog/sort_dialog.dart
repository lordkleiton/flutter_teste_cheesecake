import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_cheesecake/consts.dart';
import 'package:teste_cheesecake/model/sort.dart';
import 'package:teste_cheesecake/state/app_state.dart';

class SortDialogComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppState appState = Provider.of(context);
    final int sortOrder = appState.sortOrder;
    final Map<int, SortOption> options = AppConsts.sortOptions;

    return AlertDialog(
      title: Text('Sort by:'),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...options.keys.map(
              (i) {
                final SortOption _old = options[i]!;
                final SortOption _new = SortOption(
                    title: _old.title, sortEnum: _old.sortEnum, value: i);

                return RadioListTile(
                  title: Text(_new.title),
                  value: _new.value,
                  groupValue: sortOrder,
                  onChanged: (value) {
                    appState.sortOrder = value as int;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
