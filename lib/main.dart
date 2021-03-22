import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_cheesecake/router.dart';
import 'package:teste_cheesecake/state/app_state.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppState()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    final AppState appState = Provider.of(context);

    appState.setup();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teste Cheesecake',
      onGenerateRoute: AppRouter.routeGenerator,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
