import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

final _shorebirdCodePush = ShorebirdCodePush();

class Update {
  Update({required this.context});

  final BuildContext context;
  final _isShorebirdAvailable = _shorebirdCodePush.isShorebirdAvailable();
  int? _currentPatchVersion;
  bool _isCheckingForUpdate = false;

  Future<void> checkForUpdate() async {
    print(_currentPatchVersion);
    final isUpdateAvailable =
        await _shorebirdCodePush.isNewPatchAvailableForDownload();

    if (isUpdateAvailable) {
      _displayDialog();
    } else {
      _displayDialog();
    }
  }

  void _displayDialog() {
    Flushbar(
      message: "mise à jour disponible",
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      mainButton: TextButton(
        onPressed: _downloadUpdate,
        child: Text("Télécharger"),
      ),
      duration: Duration(seconds: 5),
      borderRadius: BorderRadius.circular(15),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Theme.of(context).colorScheme.surface,
    ).show(context);
  }

  Future<void> _downloadUpdate() async {
    await Future.wait([
      _shorebirdCodePush.downloadUpdateIfAvailable(),
      // Add an artificial delay so the banner has enough time to animate in.
      Future<void>.delayed(const Duration(milliseconds: 250)),
    ]);
    _showRestartBanner();
  }

  void _showRestartBanner() {
    Flushbar(
      message: "Redémarrage nécéssaire",
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      mainButton: TextButton(
        onPressed: Restart.restartApp,
        child: Text("Redémarrer"),
      ),
      duration: Duration(seconds: 5),
      borderRadius: BorderRadius.circular(15),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Theme.of(context).colorScheme.surface,
    ).show(context);
  }
}
