import 'package:flutter/material.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'package:plaktago/utils/app_settings.dart';
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
  AppSettings appSettings = AppSettings();
  bool settings = false;
  final Color primaryColor = Color.fromRGBO(149, 169, 225, 1);

  @override
  void initState() {
    getSettings();
    super.initState();
  }

  void getSettings() async {
    settings = await appSettings.getSeetingsFromFile();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<IsarService>(
        create: (_) => IsarService(),
        builder: (context, child) {
          return Consumer<IsarService>(builder: (context, provider, child) {
            IsarService isarService = context.watch<IsarService>();
            return MaterialApp(
                home: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  settings
                      ? ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width,
                            maxHeight: MediaQuery.of(context).size.height,
                          ),
                          child: Plaktago(
                              appSettings: appSettings,
                              isarService: isarService))
                      : CircularProgressIndicator(
                          color: primaryColor,
                        )
                ]));
          });
        });
  }
}
