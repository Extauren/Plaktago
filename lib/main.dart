import 'package:flutter/material.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'package:provider/provider.dart';
import 'plaktago.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _App();
}

class _App extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<IsarService>(
        create: (_) => IsarService(),
        builder: (context, child) {
          return Consumer<IsarService>(builder: (context, provider, child) {
            IsarService isarService = context.watch<IsarService>();
            return MaterialApp(
                home: Plaktago(
              isarService: isarService,
            ));
          });
        });
  }
}
